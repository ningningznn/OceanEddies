% Take the .mat files and create a .csv out of them.  This will% then get loaded into PostgreSQLfunction [] = mat_to_csv()	fid = fopen('eddies.csv', 'w');	fprintf(fid, 'track_id,lat,lon,date,surface_area,amplitude,radius,mean_geo_speed,cyclonic\n');	files = {'anticyc_simple.mat', 'cyclonic_simple.mat'};	next_id = 1;	disp('Processing anticyc_simple.mat')	load('data/anticyc_simple.mat')	next_id = write_data(s_tracks, fid, next_id,-1)	disp('Processing cyclonic_simple.mat')	load('data/cyclonic_simple.mat')	next_id = write_data(s_tracks, fid, next_id,1)endfunction [next_id] = write_data(data, fid, next_id, cyclonic)	for i = 1:length(data)  		track = data{i};  		for j = 1:size(track, 1)  			fprintf(fid, '%d,%f,%f,%d,%f,%f,%f,%f,%f\n', [next_id, track(j, :), cyclonic]);  		end  		next_id = next_id + 1;  	endend