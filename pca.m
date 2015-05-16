function impvecs = pca(data)
% Implements principle component analysis for different data sets
% Returns the most important eigenvectors of the covariance matrix
if all(size(data) < 5000)
    % If data are small then just do a straightforward calculation of
    % eigenvectors from the covariance matrix
    dcov = cov(data);
    [vecs, vals] = eig(dcov);
    vals = diag(vals);
    cumvals = cumsum(vals, 'reverse');
    ind = max(find(vals > .01*sum(vals), 1), find(cumvals < .95*sum(vals), 1) + 1);
    impvecs = fliplr(vecs(:,ind:end));
else
    % If data are large then covariance matrix cannot be calculated so use
    % a different method to obtain eigenvectors.
    ndata = data - repmat(sum(data), size(data, 1), 1);
    khcov = ndata*ndata';
    [fv, ~] = eig(khcov);
    vecs = ndata'*fv;
    vecs = vecs(:,1:end-1);
    vals = abs(diag(ndata*vecs));
    %impvecs = fliplr(vecs(:,vals > .01*sum(vals)));
    impvecs = fliplr(vecs);
    impvecs = impvecs./repmat(sum(impvecs), size(data, 2), 1);
end
end

