# re-jwt


[![CircleCI](https://circleci.com/gh/yourgithubhandle/re-jwt/tree/master.svg?style=svg)](https://circleci.com/gh/yourgithubhandle/re-jwt/tree/master)


**Contains the following libraries and executables:**

```
re-jwt@0.0.0
│
├─test/
│   name:    TestReJwt.exe
│   main:    TestReJwt
│   require: re-jwt.lib
│
├─library/
│   library name: re-jwt.lib
│   namespace:    ReJwt
│   require:
│
└─executable/
    name:    ReJwtApp.exe
    main:    ReJwtApp
    require: re-jwt.lib
```

## Developing:

```
npm install -g esy
git clone <this-repo>
esy install
esy build
```

## Running Binary:

After building the project, you can run the main binary that is produced.

```
esy x ReJwtApp.exe 
```

## Running Tests:

```
# Runs the "test" command in `package.json`.
esy test
```
