#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define MAX_NOME 51
#define MAX_CPF 11
#define TAM_CPF 12
#define MAX_MARCA 51
#define MAX_MODELO 51
#define MAX_COR 31
#define MAX_PLACA 7
#define TAM_PLACA 20
#define MIN_NOME 3
#define MIN_MARCA 2
#define MAX_AUTO 100

//Sintese:
//Enunciado: Crie uma representação do que seria um projeto de banco de dados eficiente para controlar o conjunto de
// dados necessários ao exercício de programação (Proprietário de Automóveis). Suponha que seu usuário deseje gerenciar
// estes cadastrados. Assim,voce deverá implementar as estruturas que serão capazes de armazenar os registros previstos
// em seu programa em C utilizando struct.

//Entrada: Dados do proprietário e dados de seu(s) veículo(s)
//Saída: Lista de todos os dados cadastrados ordenados pelo cpf

typedef struct {
    char marca[MAX_MARCA];
    char modelo[MAX_MODELO];
    char cor[MAX_COR];
    char placa[TAM_PLACA];
}automovel;

typedef struct {
    char nome[MAX_NOME];
    char cpf[TAM_CPF];
    automovel automoveis[MAX_AUTO];
    int qtdAuto;
} pessoa;



void cadastrarPessoa();
void validarNome(char *nome);
void validarCPF(char *cpf);
void cadastrarAutomovel(automovel *novoAutomovel);
void validarMarca(char *marca);
void validarModelo(char *modelo);
void validarCor(char *cor);
void validarPlaca(char *placa);
void imprimirCadastros(int qtdPessoas);
void inserirNovaPessoa(pessoa novaPessoa);
void quicksortM3(pessoa *vetor, int comeco, int fim);
int separa(pessoa *vetor, int comeco, int fim);


int main(){
    char opcao;
    int qtdPessoas = 0;
    printf("Deseja cadastrar uma pessoa?\n");
    printf("Digite 's' para SIM ou 'n' para NAO\n");
    scanf(" %c", &opcao);
    if(opcao == 's'){
        cadastrarPessoa();
        qtdPessoas++;
        printf("Deseja cadastrar mais pessoas?\n");
        printf("Digite 's' para SIM ou 'n' para NAO\n");
        scanf(" %c", &opcao);
        while(opcao == 's'){
            cadastrarPessoa();
            qtdPessoas++;
            printf("Deseja cadastrar mais pessoas?\n");
            printf("Digite 's' para SIM ou 'n' para NAO\n");
            scanf(" %c", &opcao);
        }
        imprimirCadastros(qtdPessoas);
    }



    return 0;
}


void imprimirCadastros(int qtdPessoas){
    FILE *pArq;
    int aux;
    pessoa auxArquivo;
    pArq = fopen("cadastro_automoveis.bin","rb");
    if(pArq == NULL){
        printf("Nao foi possivel abrir o arquivo\n");
    }
    else{
        printf("\n");
        fseek(pArq,0,SEEK_SET);

        while(fread(&auxArquivo,sizeof(auxArquivo),1,pArq)){
            printf("PESSOA:\n");
            printf("\tNome: %s\n", auxArquivo.nome);
            printf("\tCPF: %s\n", auxArquivo.cpf);
            printf("\tAutomoveis:\n");
            for(aux = 0; aux < auxArquivo.qtdAuto; aux++){
                printf("\t\t%d.\n", aux+1);
                printf("\t\t\tMarca: %s\n", auxArquivo.automoveis[aux].marca);
                printf("\t\t\tModelo: %s\n", auxArquivo.automoveis[aux].modelo);
                printf("\t\t\tCor: %s\n", auxArquivo.automoveis[aux].cor);
                printf("\t\t\tPlaca: %s\n", auxArquivo.automoveis[aux].placa);
            }
            printf("\n\n");
        }

        if(fclose(pArq) != 0){
            printf("Nao fechou corretamente\n");
        }

    }
}
void cadastrarPessoa(){
    char opcao;
    pessoa novaPessoa;
    automovel *novoAutomovel = malloc(sizeof(automovel));
    novaPessoa.qtdAuto = 0;
    printf("\n");
    printf("Digite o nome da pessoa:\n");
    scanf(" %[^\n]", novaPessoa.nome);
    validarNome(novaPessoa.nome);
    printf("\n");

    printf("Digite o CPF (somente numeros):\n");
    scanf(" %[^\n]", novaPessoa.cpf);
    validarCPF(novaPessoa.cpf);
    printf("\n");


    printf("Deseja cadastrar automoveis para essa pessoa?\n");
    printf("Digite 's' para SIM ou 'n' para NAO\n");
    scanf(" %c", &opcao);
    while(opcao == 's'){

        cadastrarAutomovel(novoAutomovel);
        strcpy(novaPessoa.automoveis[novaPessoa.qtdAuto].marca, novoAutomovel->marca);
        strcpy(novaPessoa.automoveis[novaPessoa.qtdAuto].modelo, novoAutomovel->modelo);
        strcpy(novaPessoa.automoveis[novaPessoa.qtdAuto].cor, novoAutomovel->cor);
        strcpy(novaPessoa.automoveis[novaPessoa.qtdAuto].placa, novoAutomovel->placa);

        novaPessoa.qtdAuto = novaPessoa.qtdAuto + 1;
        printf("Deseja cadastrar mais automoveis para essa pessoa?\n");
        printf("Digite 's' para SIM ou 'n' para NAO\n");
        scanf(" %c", &opcao);
    }

    inserirNovaPessoa(novaPessoa);

    free(novoAutomovel);
}

void inserirNovaPessoa(pessoa novaPessoa){
    pessoa *cadastros = malloc(sizeof(pessoa) * 100);
    FILE *pArq;
    int aux = 1;
    pessoa auxArquivo;
    int tamanhoCad;
    //colocando a nova pessoa na primeira posicao do vetor
    cadastros[0] = novaPessoa;

    //pegando os registros do arquivo e trazendo para a memoria
    pArq = fopen("cadastro_automoveis.bin","rb");
    if(pArq == NULL){
        printf("Nao foi possivel abrir o arquivo\n");
    }
    else{
        printf("\n");
        fseek(pArq,0,SEEK_SET);

        while(fread(&auxArquivo,sizeof(auxArquivo),1,pArq)){
            cadastros[aux] = auxArquivo;
            aux++;
        }

        if(fclose(pArq) != 0){
            printf("Nao fechou corretamente\n");
        }

    }

    tamanhoCad = aux;
    //ordenando
    quicksortM3(cadastros, 0, tamanhoCad);


    //gravando os registros ordenados no arquivo

    pArq = fopen("cadastro_automoveis.bin","w+b");
    printf("Tamanho cad: %d\n", tamanhoCad);
    if(pArq == NULL){
        printf("Nao foi possivel abrir o arquivo\n");
    }
    else{
        for(aux = 0; aux < tamanhoCad; aux++){
            fwrite(&cadastros[aux],sizeof(pessoa),1,pArq);
        }

        if(fclose(pArq)!=0){
            printf("Nao fechou corretamente\n");
        }
        else{
            printf("Cadastro de pessoa realizado com sucesso !\n");
        }

    }

    free(cadastros);
}

void validarNome(char *nome){
    while(strlen(nome) < MIN_NOME){
        printf("Tamanho invalido, digite um nome com pelo menos 3 caracteres\n");
        scanf(" %[^\n]", nome);
    }

    while(strlen(nome) > MAX_NOME){
        printf("Tamanho invalido, digite um nome com menos de 50 caracteres\n");
        scanf(" %[^\n]", nome);
    }

}

void validarCPF(char *cpf){

    while(strlen(cpf) != MAX_CPF ){
        printf("Tamanho invalido, o CPF deve conter 11 caracteres\n");
        scanf(" %[^\n]", cpf);
    }
}

void cadastrarAutomovel(automovel *novoAutomovel){
    printf("Digite a marca do automovel:\n");
    scanf(" %[^\n]", novoAutomovel->marca);
    validarMarca(novoAutomovel->marca);
    printf("\n");


    printf("Digite o modelo do automovel:\n");
    scanf(" %[^\n]", novoAutomovel->modelo);
    validarModelo(novoAutomovel->modelo);
    printf("\n");

    printf("Digite a cor do automovel:\n");
    scanf(" %[^\n]", novoAutomovel->cor);
    validarCor(novoAutomovel->cor);
    printf("\n");

    printf("Digite a placa do automovel (somente letras maiusculas e numeros):\n");
    scanf(" %[^\n]", novoAutomovel->placa);
    validarPlaca(novoAutomovel->placa);
    printf("\n");
    printf("Cadastro de automovel realizado com sucesso !\n");

}

void validarPlaca(char *placa){
    while(strlen(placa) != MAX_PLACA){
        printf("Tamanho invalido, a placa deve conter 7 caracteres\n");
        scanf(" %[^\n]", placa);
    }
}
void validarCor(char *cor){
    while(strlen(cor) < MIN_MARCA){
        printf("Tamanho invalido, digite um modelo com pelo menos 2 caracteres\n");
        scanf(" %[^\n]", cor);
    }

    while(strlen(cor) > MAX_COR){
        printf("Tamanho invalido, digite um modelo com menos de 30 caracteres\n");
        scanf(" %[^\n]", cor);
    }

}

void validarModelo(char *modelo){
    while(strlen(modelo) < MIN_MARCA){
        printf("Tamanho invalido, digite um modelo com pelo menos 2 caracteres\n");
        scanf(" %[^\n]", modelo);
    }

    while(strlen(modelo) > MAX_MODELO){
        printf("Tamanho invalido, digite um modelo com menos de 50 caracteres\n");
        scanf(" %[^\n]", modelo);
    }
}

void validarMarca(char *marca){
    while(strlen(marca) < MIN_MARCA){
        printf("Tamanho invalido, digite um nome com pelo menos 2 caracteres\n");
        scanf(" %[^\n]", marca);
    }

    while(strlen(marca) > MAX_MARCA){
        printf("Tamanho invalido, digite um nome com menos de 50 caracteres\n");
        scanf(" %[^\n]", marca);
    }
}

void quicksortM3(pessoa *vetor, int comeco, int fim){
    int j, meio = (fim+comeco)/2;
    pessoa temp;
    if(fim<=comeco){
        return;
    }
    temp = vetor[fim-1];
    vetor[fim-1] = vetor[meio];
    vetor[meio] = temp;

    if(strcmp(vetor[fim].cpf, vetor[meio].cpf) > 0){
        temp = vetor[fim];
        vetor[fim] = vetor[meio];
        vetor[meio] = temp;
        if( strcmp(vetor[meio].cpf, vetor[comeco].cpf) > 0){
            temp = vetor[comeco];
            vetor[comeco] = vetor[meio];
            vetor[meio] = temp;
            if( strcmp(vetor[meio].cpf, vetor[fim].cpf) > 0){
                temp = vetor[fim];
                vetor[fim] = vetor[meio];
                vetor[meio] = temp;
            }
        }
    }


    j = separa(vetor, comeco, fim);
    quicksortM3(vetor, comeco, j-1);
    quicksortM3(vetor, j+1, fim);
}

int separa(pessoa *vetor, int comeco, int fim){
    pessoa pivo = vetor[fim];
    pessoa temp;
    int j = comeco, aux;
    for(aux=comeco; aux < fim; aux++){
        if( strcmp(vetor[aux].cpf, pivo.cpf) > 0){
            temp = vetor[aux];
            vetor[aux] = vetor[j];
            vetor[j] = temp;
            j++;
        }

    }
    temp = vetor[j];
    vetor[j] = vetor[fim];
    vetor[fim] = temp;
    return j;

}


