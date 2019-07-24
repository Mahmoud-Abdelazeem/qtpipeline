# pragma once 
#include<iostream>
#include<math.h>
#include<gtest/gtest.h>
#include <vector>
#include <gmock/gmock.h>

class stack {

std::vector<int> vstack= {};

public: 

void push (int value);

int pop() ;

int getsize () ;

};

struct stackTest: public testing::Test{

stack s1;

void SetUp ();

void TearDown();


};
