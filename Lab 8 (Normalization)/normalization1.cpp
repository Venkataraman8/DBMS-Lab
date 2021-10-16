#include <bits/stdc++.h>
using namespace std;

struct FD {
	string alphaStr, betaStr;

	FD(string fd) {
		alphaStr = "", betaStr = "";
		bool currentlyAlpha = true;
		for(int i = 0; i < fd.length(); ++i) {
			if(fd[i] == '-' || fd[i] == '>') {
				currentlyAlpha = false;
			} else if (currentlyAlpha) {
				alphaStr += fd[i];
			} else {
				betaStr += fd[i];
			}
		}
	}
};

string UnionString(string a, string b) {
	bool visited[26] = {false};
	for(int i = 0; i < a.length(); ++i) {
		visited[a[i] - 'a'] = true;	
	}
	for(int i = 0; i < b.length(); ++i) {
		visited[b[i] - 'a'] = true;
	} 
	string ans = "";
	for(int i = 0; i < 26; ++i) {
		if(visited[i]) ans += 'a' + i;
	}
	return ans;
}

string getClosure(map<string, string> fd, string input) {
	string ans = input;
	
	for(int i = 1; i < pow(2,ans.length()); ++i) {
			
		string a = "";
		
		int cnt=0;
		int num=i;
		
        //binary subsequence
		while(num!=0)
		{
			if(num&1)
			a+=ans[cnt];

			cnt++;
			num>>=1;
		}

		if(fd.find(a) != fd.end()) {

			ans = UnionString(ans, fd[a]);
		}
		
	}
	
	return ans;
} 

int main() {
	int countAttrSet, countFd;
	cin >> countAttrSet >> countFd;
	char tempChar;
	string tempStr, attrSetStr = "";

	vector<char> attrSet;
	FD *temp;
	vector<string> alphas, betas;
	map<string, string> fd;

	for(int i = 0; i < countAttrSet; ++i) {
		cin >> tempChar;
		attrSetStr += tempChar;
		attrSet.push_back(tempChar);
	}

	for(int i = 0; i < countFd; ++i) {
		cin >> tempStr;
		temp = new FD(tempStr);

		alphas.push_back(temp->alphaStr);
		betas.push_back(temp->betaStr);
		fd[temp->alphaStr] = temp->betaStr;
	}

	int total = 0;
	vector<string> superKeys;
	for(int i = 0; i < pow(2,attrSetStr.length()); ++i) {
		
        string subs="";
        vector<int> idx;
        int cnt=0;
        int num=i;

        //binary subsequence
        while(num!=0)
        {
            if(num&1)
            {
                subs+=attrSetStr[cnt];
            }
            cnt++;
            num/=2;
        }

		string closure =  getClosure(fd, subs);

		if (closure.length() == attrSetStr.length()) {
			bool flag = true;

			if(flag) superKeys.push_back(subs);
		}

		// if(subs!="")
        cout << subs << "->" << closure << endl;
		total += (int) pow(2, closure.length());
		// }
	}
    
	cout << "Total Functional Dependencies: " << total << endl;
	cout << "Super Keys: ";
	vector<string>::iterator x;
	vector<string> candidatekeys;
	int mn=INT_MAX;

	for(x = superKeys.begin(); x != superKeys.end(); ++x) {
		cout << *x << ", ";
        if((*x).size()<mn)
		{
			candidatekeys.clear();
			mn=(*x).size();
			candidatekeys.push_back(*x);
		}
		else if((*x).size()==mn)
		{
			candidatekeys.push_back(*x);
		}
	}
	cout << endl;

	cout<<"Candidate Keys: ";
	
	for(auto i:candidatekeys)
	cout<<i<<' ';

}