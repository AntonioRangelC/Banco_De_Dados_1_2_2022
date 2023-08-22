#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define MAX_NOME 51
#define MAX_CPF 11
#define TAM_CPF 20
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
//Saída: Lista de todos os dados cadastrados

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


int main(){
    char opcao;
    int qtdPessoas = 0;
    //criarNovoArquivo();
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
    int  aux;
    char opcao;
    pessoa novaPessoa;
    automovel *novoAutomovel = malloc(sizeof(automovel));
    novaPessoa.qtdAuto = 0;
    FILE *pArq;
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

    pArq = fopen("cadastro_automoveis.bin","ab");
    if(pArq == NULL){
        printf("Nao foi possivel abrir o arquivo\n");
    }
    else{

        fwrite(&novaPessoa,sizeof(novaPessoa),1,pArq);
        if(fclose(pArq)!=0){
            printf("Nao fechou corretamente\n");
        }
        else{
            printf("Cadastro de pessoa realizado com sucesso !\n");
        }

    }
    free(novoAutomovel);
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


