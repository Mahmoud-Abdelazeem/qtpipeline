#include <QCoreApplication>
#include <memory>
#include <QDebug>

using namespace std;

class stack {
    vector<int> vstack = {};
public:
    void push (int value) {vstack.push_back(value);}

    int pop () {
        if (vstack.size()>0) {
            int value = vstack.back(); // returns reference to the last element of the container. calling back() on an empty container is undefined
            vstack.pop_back(); // removes the last element of the container. calling pop_back() on an empty container is undefined
            return value;

        }else {
            return -1;
        }
    }
    int size() {
        return vstack.size();
    }
};


int main(int argc, char *argv[])
{
    auto Mupointer=std::make_unique<int> ;
    QCoreApplication a(argc, argv);
    qDebug()<< "Hello world";

    return a.exec();
}