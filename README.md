# shark-experiments

## Example usage

### Cloning the repos

```bash
git clone https://github.com/pocs-anguilla/shark-mod.git
git clone https://github.com/pocs-anguilla/shark-experiments.git

cd shark-experiments
git submodule update --init
```

### Building and runninng experiments

```bash
conda activate anguilla-devcontainer

cd shark-experiments

make shark_build
make shark_install

make experiments

cd _experiments_build
./experiment_1
```

