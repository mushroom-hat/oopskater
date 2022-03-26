.class public Lcom/tpcstld/twozerogame/Tile;
.super Lcom/tpcstld/twozerogame/Cell;
.source "Tile.java"


# instance fields
.field private mergedFrom:[Lcom/tpcstld/twozerogame/Tile;

.field private final value:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/tpcstld/twozerogame/Tile;->mergedFrom:[Lcom/tpcstld/twozerogame/Tile;

    .line 9
    iput p3, p0, Lcom/tpcstld/twozerogame/Tile;->value:I

    return-void
.end method

.method public constructor <init>(Lcom/tpcstld/twozerogame/Cell;I)V
    .locals 1

    .line 13
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v0

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result p1

    invoke-direct {p0, v0, p1}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/tpcstld/twozerogame/Tile;->mergedFrom:[Lcom/tpcstld/twozerogame/Tile;

    .line 14
    iput p2, p0, Lcom/tpcstld/twozerogame/Tile;->value:I

    return-void
.end method


# virtual methods
.method public getMergedFrom()[Lcom/tpcstld/twozerogame/Tile;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/tpcstld/twozerogame/Tile;->mergedFrom:[Lcom/tpcstld/twozerogame/Tile;

    return-object v0
.end method

.method public getValue()I
    .locals 1

    .line 23
    iget v0, p0, Lcom/tpcstld/twozerogame/Tile;->value:I

    return v0
.end method

.method public setMergedFrom([Lcom/tpcstld/twozerogame/Tile;)V
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/tpcstld/twozerogame/Tile;->mergedFrom:[Lcom/tpcstld/twozerogame/Tile;

    return-void
.end method

.method public updatePosition(Lcom/tpcstld/twozerogame/Cell;)V
    .locals 1

    .line 18
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/tpcstld/twozerogame/Tile;->setX(I)V

    .line 19
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/tpcstld/twozerogame/Tile;->setY(I)V

    return-void
.end method
