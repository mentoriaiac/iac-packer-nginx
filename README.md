# Packer Template

Este repositório contém a estrutura básica para criação de um Packer template além de um pipeline para validação do template e demais arquivos necessários.

O Packer template será utilizado em conjunto com playbooks Ansible para que a imagem resultante seja utilizada pelo Terraform no provisionamento dos ambientes.

## Requisitos

| Nome      	| Versao 	|
|--------------	|---------	|
|   Packer      |  >=1.7    |


## Variáveis

Todas as variáveis que são necessárias no arquivo variables.pkr.hcl para executar o template: 

| Variable     	| Default 	| Required 	| Description                                                                            	|
|--------------	|---------	|----------	|----------------------------------------------------------------------------------------	|
|               |           |           |                                                                                           |

## Como Testar Localmente

1- Editar os arquivos no diretório ``packer/`` de acordo com as variáveis, source e provisioners necessários.

2- Executar comando ``make validate`` para o validate e formating da imagem.

3- (Opcional) ``make build`` faz o build da imagem na plataforma configurada no arquivo ``packer/source.pkr.hcl``

## Observações

- Motivo do uso de HCL2 ao invés de json: As of version 1.7.0, HCL2 support is no longer in beta and is the **preferred way to write Packer configuration(s)** - [Hashicorp Docs](https://www.packer.io/guides/hcl/from-json-v1)
