.PHONY: generate dep_update lint breaking all

## generate: Generate code from proto files
generate:
	buf generate

## dep_update: Update deps
dep_update:
	buf dep update

## lint: Lint proto files for style and best practices
lint:
	buf lint

## breaking: Check for breaking changes in proto files against main branch of protos repo
breaking:
	buf breaking --against 'https://github.com/radahn42/protos.git#branch=master'
	# Или, если вы хотите сравнивать с предыдущим локальным коммитом (менее надежно для CI/CD, но полезно локально):
	# buf breaking --against 'HEAD~1'
	# Или, если вы используете BSR (Buf Schema Registry) и публикуете туда модули:
	# buf breaking --against 'buf.build/radahn42/sso-protos:main'
	# Используйте ту версию, которая наиболее подходит для вашего CI/CD.
	# Вариант с 'https://...' наиболее надежен для отдельного репозитория protos.

## all: Run all proto-related tasks (lint, breaking, generate)
all: lint breaking generate
