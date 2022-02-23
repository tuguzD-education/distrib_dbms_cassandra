from cassandra.cluster import Cluster
from os import listdir, walk


def execute_from_file(file_root: str):
    print(f'\nExecuting from file: {file_root}')
    with open(file_root, mode='r') as f:
        lines = f.readlines()
        statements = ' '.join([line.strip() for line in lines]).split(r';')

        for statement in statements:
            query = statement.strip()
            if query != '':
                print(f'QUERY: "{query}"')
                session.execute(query)


def scheme_from_folder(folder_name: str):
    [execute_from_file(f'{folder_name}/{file_name}')
        for file_name in listdir(folder_name)]


if __name__ == '__main__':
    session = Cluster(port=9042).connect('tugushev')

    [scheme_from_folder(folder) for folder in next(walk(''))[1]]
