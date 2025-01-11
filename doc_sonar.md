## Ручной запуск для проверки

```
cd d:\j\workspace\Jenkins-Lib_ci_otus_fix_coverage
sonar-scanner -Dsonar.projectVersion=1.0.39.2
```

Файл настроек: sonar-project.properties

## Ручной запуск с учетом файла покрытия

```
sonar-scanner -Dsonar.projectVersion=1.0.39.2 -Dsonar.coverageReportPaths=build/out/yaxunit-coverage.xml 
```

