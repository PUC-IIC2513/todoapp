# Guide to learn some basic testing

## Steps (for rails default test suite)
#### A proposed version of this test are on the testing branch
1.- Watch the YML fixtures

2.- Modify and try embeding some ruby

3.- Modify the tests in test/models and try the assert true (rake test test/models/*). Before this you should already have created a database for testing -> rake db:test:clone

4.- Create some creation model tests

5.- Test every (relevant) method in the model

6.- Add some validation to the model - watch the tests fail

7.- Move to the controller tests

8.- Test some of the actions

9.- Try some integration test with log-in
