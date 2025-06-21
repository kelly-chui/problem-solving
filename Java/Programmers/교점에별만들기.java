import java.util.*;

class Point {
    int x, y;
    Point(int x, int y) {
        this.x = x;
        this.y = y;
    }
}
class Solution {
    private static double[] findIntersection(int[] line1, int[] line2) {
        double a = line1[0], b = line1[1], e = line1[2];
        double c = line2[0], d = line2[1], f = line2[2];
        double x = (b * f - e * d) / (a * d - b * c);
        double y = (e * c - a * f) / (a * d - b * c);
        return new double[] {x, y};
    }
    
    public String[] solution(int[][] line) {
        List<Point> intersections = new ArrayList<>();
        for (int i = 0; i < line.length; i++) {
            for (int j = i + 1; j < line.length; j++) {
                double[] intersection = Solution.findIntersection(line[i], line[j]);
                double epsilon = 1e-9;
                if (Math.abs(intersection[0] - Math.round(intersection[0])) > epsilon || 
                    Math.abs(intersection[1] - Math.round(intersection[1])) > epsilon) {
                    continue;
                }

                int x = (int)Math.round(intersection[0]);
                int y = (int)Math.round(intersection[1]);
                intersections.add(new Point(x, y));
            }
        }
        int minX = intersections.stream().mapToInt(p -> p.x).min().orElse(0);
        int maxX = intersections.stream().mapToInt(p -> p.x).max().orElse(0);
        int minY = intersections.stream().mapToInt(p -> p.y).min().orElse(0);
        int maxY = intersections.stream().mapToInt(p -> p.y).max().orElse(0);
        char[][] graph = new char[maxY - minY + 1][maxX - minX + 1];
        for (int i = 0; i < graph.length; i++) {
            Arrays.fill(graph[i], '.');
        }
        for (int i = 0; i < intersections.size(); i++) {
            graph[intersections.get(i).y - minY][intersections.get(i).x - minX] = '*';
        }
        for (int i = 0; i < graph.length / 2; i++) {
            char[] temp = graph[i];
            graph[i] = graph[graph.length - i - 1];
            graph[graph.length - i - 1] = temp;
        }
        String[] answer = new String[graph.length];
        for (int i = 0; i < graph.length; i++) {
            answer[i] = new String(graph[i]);
        }
        return answer;
    }
}
