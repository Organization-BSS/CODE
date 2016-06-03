//
//  main.m
//  DataStruct-MGraph
//
//  Created by bss on 5/25/16.
//  Copyright © 2016 DevilTaining_bss. All rights reserved.
//

#import <Foundation/Foundation.h>



// 图的邻接矩阵存储结构

typedef int VertexType; /* 顶点类型应由用户定义 */
typedef int EdgeType;    /* 边上的权值类型应由用户定义 */
#define MAXVEX 100       /* 最大顶点数，应用用户定义 */
#define INFINITY1 100000
typedef struct {
    VertexType vexs[MAXVEX];             /* 顶点表 */
    EdgeType arc[MAXVEX][MAXVEX];        /* 邻接矩阵，可看作边表 */
    int numVertexes,numEdges;            /* 图中当前的顶点数和边数 */
    int isTrav[MAXVEX];                  /* 遍历标志 */
    int GraphType;                       /* 图的类型（0:无向图，1:有向图）*/
} MGraph;

/* 建立无向图的邻接矩阵表示 */
// 图的创建
void createMGraph(MGraph *G){
    int i,j,k,w;
    printf("输入顶点数和边数：\n");
    scanf("%d,%d",&G->numVertexes,&G->numEdges); /* 输入顶点数和边数 */
    printf("顶点数：%d,边数:%d \n",G->numVertexes,G->numEdges);

    for(i = 0;i < G->numVertexes; i++)  /* 输入顶点信息，建立顶点表 */
    {
        int c =0;
        scanf("%d",&c);
        G->vexs[i] = c;

    }
    
//    for (i = 0; i < G->numVertexes; i++) {
//        for (j = 0; j < G->numVertexes; j++) {
//            G->arc[i][j] = ，INFINITY1;
//        }
//    }
//    for (k = 0; k< G->numEdges; k++) {
//        printf("输入边（vi，vj）上的下标i，下标j和权w：\n");
//        scanf("%d,%d,%d",&i,&j,&w);
//        G->arc[i][j] = w;
//        G->arc[j][i] = G->arc[i][j]; /* 因为是无向图，矩阵对称 */
//    }
}

// 输出图信息
void outMGpraph(MGraph *G) {
    int i,j;
    for (j = 0; j< G->numVertexes; j++) {
        printf("\t%d",G->vexs[j]);
    }
    printf("\n");
    for (i = 0; i<G->numVertexes; i++) {
        printf("%d",G->vexs[i]);
        for (j = 0; j< G->numVertexes; j++) {
            if (G->arc[i][j]== INFINITY1) {
                printf("\t无穷");
            }
            else
                printf("\t%d",G->arc[i][j]);
        }
        printf("\n");
    }
}
/* n个顶点，e条边，图的创建时间复杂度为o(n+n*n+e) */

/* 邻接表图的存储方式 */
#define VERTEX_MAX 20               //图的最大顶点数

//定义顶点结构
typedef struct edgeNode {
    int Vertex;                     // 顶点序号
    int weight;                     // 权值
    struct edgeNode *next;          //指向有边的下一个顶点
}EdgeNode;

//定义图结构
typedef struct{
    EdgeNode Adjlist[VERTEX_MAX];   // 存取顶点指针的数组
    int VertexNumber, EdgeNumber;    // 定义顶点数和边数
    int GraphType;                   // 0:无向图 1:有向图
}AdjListGraph;

// 创建以邻接表为存储结构的图 －－－－ 无向图
void creatGraph_AdjacencyList(AdjListGraph  *G) {
    int i,weight;
    int start,end;
    EdgeNode *s = NULL;
    printf("请输入顶点数和边数\n");
    scanf("%d,%d",&G->VertexNumber,&G->EdgeNumber);
    for (i = 1; i <= G->VertexNumber; i++ ) {
        G->Adjlist[i].Vertex = i;
        G->Adjlist[i].next = NULL;
    }
    
    for (i = 0; i < G->EdgeNumber; i++) {
        printf("请输入边的起点，终点，权值\n");
        scanf("%d,%d,%d",&start,&end,&weight);
        s = (EdgeNode *)malloc(sizeof(EdgeNode));
        s->next = G->Adjlist[start].next;
        s->weight = weight;
        s->Vertex = end;
        G->Adjlist[start].next = s;
        
        s = (EdgeNode *)malloc(sizeof(EdgeNode));
        s->next = G->Adjlist[end].next;
        s->weight = weight ;
        s->Vertex = start;
        G->Adjlist[end].next = s;
        
        }
    for (i = 1; i <= G->VertexNumber; i++) {
        printf("%d\n",G->Adjlist[i].Vertex);
    }
   
}

// 输出以邻接表存储的图
void outGraph_AdjacencyList(AdjListGraph *G) {
    printf("输出图的邻接表");
    for (int i = 1; i <= G->VertexNumber; i++) {
        printf("顶点%d",i);
        EdgeNode *node = G->Adjlist[i].next;
        while (node) {
            printf("->%d<%d>",node->Vertex,node->weight);
            node = node->next;
        }
        printf("\n");
    }
}

// 进入测试邻接表的入口
void testAdjacencyList(){
    printf("testAdjacencyList\n");
  AdjListGraph G ;
    creatGraph_AdjacencyList(&G);
    outGraph_AdjacencyList(&G);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        testAdjacencyList();

    }
    return 0;
}
