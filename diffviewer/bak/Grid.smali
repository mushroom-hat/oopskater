.class public Lcom/tpcstld/twozerogame/Grid;
.super Ljava/lang/Object;
.source "Grid.java"


# instance fields
.field private final bufferField:[[Lcom/tpcstld/twozerogame/Tile;

.field public final field:[[Lcom/tpcstld/twozerogame/Tile;

.field public final undoField:[[Lcom/tpcstld/twozerogame/Tile;


# direct methods
.method public constructor <init>(II)V
    .locals 2

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    filled-new-array {p1, p2}, [I

    move-result-object v0

    const-class v1, Lcom/tpcstld/twozerogame/Tile;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Lcom/tpcstld/twozerogame/Tile;

    iput-object v0, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    .line 13
    filled-new-array {p1, p2}, [I

    move-result-object v0

    const-class v1, Lcom/tpcstld/twozerogame/Tile;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Lcom/tpcstld/twozerogame/Tile;

    iput-object v0, p0, Lcom/tpcstld/twozerogame/Grid;->undoField:[[Lcom/tpcstld/twozerogame/Tile;

    .line 14
    filled-new-array {p1, p2}, [I

    move-result-object p1

    const-class p2, Lcom/tpcstld/twozerogame/Tile;

    invoke-static {p2, p1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [[Lcom/tpcstld/twozerogame/Tile;

    iput-object p1, p0, Lcom/tpcstld/twozerogame/Grid;->bufferField:[[Lcom/tpcstld/twozerogame/Tile;

    .line 15
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/Grid;->clearGrid()V

    .line 16
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/Grid;->clearUndoGrid()V

    return-void
.end method

.method private clearUndoGrid()V
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 130
    :goto_0
    iget-object v2, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    array-length v2, v2

    if-ge v1, v2, :cond_1

    const/4 v2, 0x0

    .line 131
    :goto_1
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v3, v3, v0

    array-length v3, v3

    if-ge v2, v3, :cond_0

    .line 132
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->undoField:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v3, v3, v1

    const/4 v4, 0x0

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private getAvailableCells()Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/tpcstld/twozerogame/Cell;",
            ">;"
        }
    .end annotation

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 29
    :goto_0
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    array-length v3, v3

    if-ge v2, v3, :cond_2

    const/4 v3, 0x0

    .line 30
    :goto_1
    iget-object v4, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v5, v4, v1

    array-length v5, v5

    if-ge v3, v5, :cond_1

    .line 31
    aget-object v4, v4, v2

    aget-object v4, v4, v3

    if-nez v4, :cond_0

    .line 32
    new-instance v4, Lcom/tpcstld/twozerogame/Cell;

    invoke-direct {v4, v2, v3}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private isCellWithinBounds(II)Z
    .locals 3

    const/4 v0, 0x0

    if-ltz p1, :cond_0

    .line 73
    iget-object v1, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    array-length v2, v1

    if-ge p1, v2, :cond_0

    if-ltz p2, :cond_0

    aget-object p1, v1, v0

    array-length p1, p1

    if-ge p2, p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method


# virtual methods
.method public clearGrid()V
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 122
    :goto_0
    iget-object v2, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    array-length v2, v2

    if-ge v1, v2, :cond_1

    const/4 v2, 0x0

    .line 123
    :goto_1
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v4, v3, v0

    array-length v4, v4

    if-ge v2, v4, :cond_0

    .line 124
    aget-object v3, v3, v1

    const/4 v4, 0x0

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public getCellContent(II)Lcom/tpcstld/twozerogame/Tile;
    .locals 1

    .line 60
    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/Grid;->isCellWithinBounds(II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object p1, v0, p1

    aget-object p1, p1, p2

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getCellContent(Lcom/tpcstld/twozerogame/Cell;)Lcom/tpcstld/twozerogame/Tile;
    .locals 2

    if-eqz p1, :cond_0

    .line 52
    invoke-virtual {p0, p1}, Lcom/tpcstld/twozerogame/Grid;->isCellWithinBounds(Lcom/tpcstld/twozerogame/Cell;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    iget-object v0, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result p1

    aget-object p1, v0, p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public insertTile(Lcom/tpcstld/twozerogame/Tile;)V
    .locals 2

    .line 78
    iget-object v0, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Tile;->getX()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Tile;->getY()I

    move-result v1

    aput-object p1, v0, v1

    return-void
.end method

.method public isCellAvailable(Lcom/tpcstld/twozerogame/Cell;)Z
    .locals 0

    .line 44
    invoke-virtual {p0, p1}, Lcom/tpcstld/twozerogame/Grid;->isCellOccupied(Lcom/tpcstld/twozerogame/Cell;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public isCellOccupied(Lcom/tpcstld/twozerogame/Cell;)Z
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lcom/tpcstld/twozerogame/Grid;->getCellContent(Lcom/tpcstld/twozerogame/Cell;)Lcom/tpcstld/twozerogame/Tile;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isCellWithinBounds(Lcom/tpcstld/twozerogame/Cell;)Z
    .locals 3

    .line 68
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v0

    const/4 v1, 0x0

    if-ltz v0, :cond_0

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v0

    iget-object v2, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 69
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result v0

    if-ltz v0, :cond_0

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result p1

    iget-object v0, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v0, v0, v1

    array-length v0, v0

    if-ge p1, v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public isCellsAvailable()Z
    .locals 2

    .line 40
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/Grid;->getAvailableCells()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public prepareSaveTiles()V
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 98
    :goto_0
    iget-object v2, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    array-length v2, v2

    if-ge v1, v2, :cond_2

    const/4 v2, 0x0

    .line 99
    :goto_1
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v4, v3, v0

    array-length v4, v4

    if-ge v2, v4, :cond_1

    .line 100
    aget-object v4, v3, v1

    aget-object v4, v4, v2

    if-nez v4, :cond_0

    .line 101
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->bufferField:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v3, v3, v1

    const/4 v4, 0x0

    aput-object v4, v3, v2

    goto :goto_2

    .line 103
    :cond_0
    iget-object v4, p0, Lcom/tpcstld/twozerogame/Grid;->bufferField:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v4, v4, v1

    new-instance v5, Lcom/tpcstld/twozerogame/Tile;

    aget-object v3, v3, v1

    aget-object v3, v3, v2

    invoke-virtual {v3}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v3

    invoke-direct {v5, v1, v2, v3}, Lcom/tpcstld/twozerogame/Tile;-><init>(III)V

    aput-object v5, v4, v2

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public randomAvailableCell()Lcom/tpcstld/twozerogame/Cell;
    .locals 5

    .line 20
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/Grid;->getAvailableCells()Ljava/util/ArrayList;

    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_0

    .line 22
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    int-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v1, v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1

    double-to-int v1, v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tpcstld/twozerogame/Cell;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public removeTile(Lcom/tpcstld/twozerogame/Tile;)V
    .locals 2

    .line 82
    iget-object v0, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Tile;->getX()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Tile;->getY()I

    move-result p1

    const/4 v1, 0x0

    aput-object v1, v0, p1

    return-void
.end method

.method public revertTiles()V
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 110
    :goto_0
    iget-object v2, p0, Lcom/tpcstld/twozerogame/Grid;->undoField:[[Lcom/tpcstld/twozerogame/Tile;

    array-length v2, v2

    if-ge v1, v2, :cond_2

    const/4 v2, 0x0

    .line 111
    :goto_1
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->undoField:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v4, v3, v0

    array-length v4, v4

    if-ge v2, v4, :cond_1

    .line 112
    aget-object v4, v3, v1

    aget-object v4, v4, v2

    if-nez v4, :cond_0

    .line 113
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v3, v3, v1

    const/4 v4, 0x0

    aput-object v4, v3, v2

    goto :goto_2

    .line 115
    :cond_0
    iget-object v4, p0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v4, v4, v1

    new-instance v5, Lcom/tpcstld/twozerogame/Tile;

    aget-object v3, v3, v1

    aget-object v3, v3, v2

    invoke-virtual {v3}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v3

    invoke-direct {v5, v1, v2, v3}, Lcom/tpcstld/twozerogame/Tile;-><init>(III)V

    aput-object v5, v4, v2

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public saveTiles()V
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 86
    :goto_0
    iget-object v2, p0, Lcom/tpcstld/twozerogame/Grid;->bufferField:[[Lcom/tpcstld/twozerogame/Tile;

    array-length v2, v2

    if-ge v1, v2, :cond_2

    const/4 v2, 0x0

    .line 87
    :goto_1
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->bufferField:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v4, v3, v0

    array-length v4, v4

    if-ge v2, v4, :cond_1

    .line 88
    aget-object v4, v3, v1

    aget-object v4, v4, v2

    if-nez v4, :cond_0

    .line 89
    iget-object v3, p0, Lcom/tpcstld/twozerogame/Grid;->undoField:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v3, v3, v1

    const/4 v4, 0x0

    aput-object v4, v3, v2

    goto :goto_2

    .line 91
    :cond_0
    iget-object v4, p0, Lcom/tpcstld/twozerogame/Grid;->undoField:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v4, v4, v1

    new-instance v5, Lcom/tpcstld/twozerogame/Tile;

    aget-object v3, v3, v1

    aget-object v3, v3, v2

    invoke-virtual {v3}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v3

    invoke-direct {v5, v1, v2, v3}, Lcom/tpcstld/twozerogame/Tile;-><init>(III)V

    aput-object v5, v4, v2

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method
