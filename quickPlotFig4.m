%function quickPlotFig2()
nuFlag = 1;
paramObj = jOut.paramObj;
jMax = jOut.jNorm;
lplcVec = paramObj.nu;
kDVec = 1 ./ paramObj.kinVar2;

[ numLpLc, numKoff, numKa ] = size( jMax );

jSelect = zeros( numLpLc, numKa );
legcell = cell( 1, numLpLc );
if nuFlag == 1
  legStr = ' $$ \nu $$ = ';
else
  legStr = ' $$ l_c l_p $$ = ';
end
for ii = 1:numLpLc
  for jj = 1:numKa
    legcell{ii} = [  legStr num2str( lplcVec(ii) ) ];
    jSelect(ii,jj) = jMax(ii, 1, jj );
  end
end

figure()
hold
for ii = 1:numLpLc
  plot( kDVec, jSelect(ii,:) )
end
ax = gca;
ax.XScale = 'log';
ax.YLim = [0 50];
xlabel('$$ K_D \, (M) $$')
ylabel('Selectivity ($$ j / j_{Diff} $$)')
h = legend( legcell, 'location','best');
h.Interpreter = 'latex';

