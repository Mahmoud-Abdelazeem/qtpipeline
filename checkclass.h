#ifndef CHECKCLASS_H
#define CHECKCLASS_H

#include <QCoreApplication>
#include <memory>
#include <QDebug>
#include <QVector>

class stack {
    QVector<int> vstack = {};
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
#endif // CHECKCLASS_H
