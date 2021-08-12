  SELECT pizza.id, pizza.name, url, ingredient.name AS ingredient FROM pizza
  LEFT JOIN pizza_ingredient ON pizza.id = pizza_ingredient.id_pizza
  WHERE pizza_ingredient.id_ingredient IS NULL;