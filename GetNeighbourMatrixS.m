%% W = N * N matrica slika, k = # najblizih susjeda. vraca simetricnu matricu susjedstva S.
function S = GetNeighbourMatrix_S(W, k)
    S = maxk(W', k)'; % vraca matricu n x k, k najvecih elemenata u svakom retku (inace vraca za stupce, zato stavljam transponiranje)
    S = S(:, k); % k.-ti najveci element
    
    S = ge(W, S); % greater or equal, ako je veci ili jednak k-tom najvecem, onda upada u k najblizih susjeda (gledamo slicnost a ne udaljenost)
    S = S | S'; % simetrija
end
