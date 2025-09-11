#include <iostream>
using namespace std;

float somarArray(float arr[], int tamanho){

	float soma = 0;
	
	for(int i = 0; i < tamanho; i++){
		soma = arr[i] + soma;
	}
    
    return soma;
}

int main(){
	
	int tamanho;
	
	cout << "Digite o tamanho do vetor : ";
	cin >> tamanho;
	
	float arr[tamanho];
	
	for(int i = 0; i < tamanho; i++){
		cout << "Digite o numero " << i + 1 << " : ";
		cin >> arr[i];
	}
	
	cout << "Valor somado do vetor e de " << somarArray(arr,tamanho);
	
	return 0;
}
