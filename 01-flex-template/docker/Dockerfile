# Base image oficial do Dataflow
FROM gcr.io/dataflow-templates-base/python3-template-launcher-base

# Diretório de trabalho no container
ARG WORKDIR=/dataflow/template
RUN mkdir -p ${WORKDIR}
WORKDIR ${WORKDIR}

# Copia os arquivos do pipeline (o contexto é definido no Terraform)
COPY ./requirements.txt ${WORKDIR}/
COPY ./pipeline.py ${WORKDIR}/

# Variáveis de ambiente exigidas pelo Dataflow
ENV FLEX_TEMPLATE_PYTHON_REQUIREMENTS_FILE="${WORKDIR}/requirements.txt"
ENV FLEX_TEMPLATE_PYTHON_PY_FILE="${WORKDIR}/pipeline.py"

# Instala dependências
RUN apt-get update && \
    pip install --no-cache-dir --upgrade pip && \
    pip install -U -r ${WORKDIR}/requirements.txt