pipeline{
	agent any
	
	triggers{ 
	
        pollSCM('H/15 1 * * *')
    }

	options{
		buildDiscarder(logRotator(numToKeepStr: '10'))
	}

	parameters{
		booleanParam name: 'RUN_TESTS', defaultValue: true, description: 'Run Tests?'
		booleanParam name: 'RUN_ANALYSIS', defaultValue: true, description: 'Run Static Code Analysis?'
		booleanParam name: 'DEPLOY', defaultValue: true, description: 'Deploy Artifacts?'
	}

	stages{
        stage('Build'){
            steps {
                cmake arguments: '-DCMAKE_TOOLCHAIN_FILE=~/vcpkg/scripts/buildsystems/vcpkg.cmake', installation: 'InSearchPath'
                cmakeBuild buildType: 'Release', cleanBuild: true, installation: 'InSearchPath', steps: [[withCmake: true]]
            }
        }

        stage('Testing'){
            when{
                environment name: 'RUN_TESTS', value: 'true'
            }
            steps{
                dir("unittest")
                {
                    sh  "bash ./run_test.sh"
                }
          }
          
          post{
            failure{
                sh "bash ./time_check.sh"
                junit "*unittest/test-result.xml"
              }
            }
          
        }
        
        stage('Analyse'){
            when {
                environment name: 'RUN_ANALYSIS', value: 'true'
            }
            steps{
                sh label: '', returnStatus: true, script: 'cppcheck . --xml --force --std=c++14 $WORKSPACE> cppcheck-result.xml'
                publishCppcheck allowNoReport: true, ignoreBlankFiles: true, pattern: '**/cppcheck-result.xml'
            }
        }

        stage('Deploy'){
            when{
                environment name: 'DEPLOY', value: 'true'
            }
            steps{
                sh label: '', returnStatus: true, script: '''cp workplace/jenkinsexample ~
                cp unittest/mahtest ~'''
            }
        }
	}
}
