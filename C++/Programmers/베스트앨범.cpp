#include <string>
#include <vector>
#include <map>
#include <tuple>
#include <algorithm>

using namespace std;
using Music = tuple<int, string, int>;

vector<int> solution(vector<string> genres, vector<int> plays) {
    vector<int> answer;
    map<string, int> genreCountMap;
    vector<Music> musics;
    for (int i = 0; i < genres.size(); i++) {
        genreCountMap[genres[i]] += plays[i];
        musics.push_back(make_tuple(i, genres[i], plays[i]));
    }
    vector<pair<string, int>> genreCount(genreCountMap.begin(), genreCountMap.end());
    sort(genreCount.begin(), genreCount.end(), [](const auto& a, const auto& b) { 
            return a.second > b.second;
    });
    for (auto it : genreCount) {
        string target = it.first;
        vector<Music> genreMusics;
        copy_if(musics.begin(), musics.end(), back_inserter(genreMusics), [&](const Music& m) {
            return get<1>(m) == target;
        });
        sort(genreMusics.begin(), genreMusics.end(), [](const Music& a, const Music& b) {
            if (get<2>(a) != get<2>(b)) {
                return get<2>(a) > get<2>(b);
            } else {
                return get<0>(a) < get<0>(b);
            }
        });
        for (int i = 0; i < min(2, (int)genreMusics.size()); i++) {
            answer.push_back(get<0>(genreMusics[i]));
        }
    }
    
    return answer;
}
