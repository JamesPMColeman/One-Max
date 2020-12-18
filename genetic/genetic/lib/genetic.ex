def initialize(genotype) do
  for _ <- 1..100, do: genotype.()
end

def evaluate(population, fitness_function) do
  population
  |> Enum.sort_by(fitness_function, &>=/2)
end

def select(population) do
  population
  |> Enum.chunk_every(2)
  |> Enum.map(&List.to_tuple(&1))
end

def run(...) do

  population = initialize()
  population
  |> evolve()

end

def evolve(population, max_fitness) do
  population = evaluate(population, ..., opts)
  best = hd(population)
  IO.write("\rCurrent Best: ...")
  if ... == max_fitness do
	best
  else
	population
	|> select()
	|> crossover()
	|> mutation()
	|> evolve()
  end
end
