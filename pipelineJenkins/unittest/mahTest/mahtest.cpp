#include <iostream>
#include <vector>
#include <gtest/gtest.h>
#include <gmock/gmock.h>


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

struct stackTest : public testing::Test  {
    stack s1;
    void SetUp(){
        int value [] = {1,2,3,4,5,6,7,8,9};
        for (auto &val : value) {
            s1.push(val);
        }
    }
    void TearDown() {}
};

TEST_F(stackTest, PopTest){

    int lastpoppedvalue = 9;
    while (lastpoppedvalue !=1){
        ASSERT_EQ(s1.pop(),lastpoppedvalue--);
    }
}
TEST_F(stackTest, sizeValidityTest){

    int val = s1.size();
    for(val;val>0;val--){
        ASSERT_NE(s1.pop(),-1);
    }
}

