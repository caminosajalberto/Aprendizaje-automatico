function[J, grad] = lrCostFunction(theta, X, y, lambda)

  valhipotesis = sigmoide(X*theta);
  m = rows(X);

  valory0 = (-y' * log(valhipotesis));
  valory1 = ((1 - y)' * log(1-valhipotesis));

  Jsinreg = (1/m)*(valory0-valory1);
  regularizacion = (lambda/(2*m)) * sum(theta(2:rows(theta)).^2);
  J = Jsinreg + regularizacion;

  grad = ((1/m) * X' * (valhipotesis - y));
  regularizacion = ((lambda/m) * theta(2:rows(theta),:));
  grad(2:rows(theta),1) = grad(2:rows(theta),1) + regularizacion;

endfunction
