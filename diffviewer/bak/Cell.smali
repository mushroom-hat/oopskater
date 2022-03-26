.class public Lcom/tpcstld/twozerogame/Cell;
.super Ljava/lang/Object;
.source "Cell.java"


# instance fields
.field private x:I

.field private y:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput p1, p0, Lcom/tpcstld/twozerogame/Cell;->x:I

    .line 9
    iput p2, p0, Lcom/tpcstld/twozerogame/Cell;->y:I

    return-void
.end method


# virtual methods
.method public getX()I
    .locals 1

    .line 13
    iget v0, p0, Lcom/tpcstld/twozerogame/Cell;->x:I

    return v0
.end method

.method public getY()I
    .locals 1

    .line 21
    iget v0, p0, Lcom/tpcstld/twozerogame/Cell;->y:I

    return v0
.end method

.method setX(I)V
    .locals 0

    .line 17
    iput p1, p0, Lcom/tpcstld/twozerogame/Cell;->x:I

    return-void
.end method

.method setY(I)V
    .locals 0

    .line 25
    iput p1, p0, Lcom/tpcstld/twozerogame/Cell;->y:I

    return-void
.end method
