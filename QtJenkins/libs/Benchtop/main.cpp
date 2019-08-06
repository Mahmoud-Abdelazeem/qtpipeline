#include <QCoreApplication>
#include <QDebug>
#include <iostream>


int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    qDebug() << "Hello World from cmake!" << endl;

    return a.exec();
}
