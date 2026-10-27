Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105412;
	b=ZUu9//aAdG5Iu3RpIJ+ug4gPrOVu3FAV0txxdH3NzILGeuZ8yg4X8w1Vm9KFGlJWgeAw
	 bWcZwWXOAJzFtJtK6wRyzmCZtJL/0vi8TU+iEipJrAoUQQIjk75DPdxHoqcl02cvhTMIo
	 3mwqowduZQ2sKe9WWVWWGl74g/AE0LvdLk7+i/piN09hEvKERdQmFMwI5TSpZvpk9gS++
	 k4rfLcPvW3SZYpUejaDnQaVtIQE/ejFSfSrhqRZg6BpJf4NecPdo7gt4irV5WbSHTE4fw
	 +JWP4E0izJOpwD77pSpt25M5VN0TkL3YWOGimA87O+bFKv5//Zpp0Ub8J1fysqiwHXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=;
	b=sNoQwlU4Z+ORSDTG0Wr0sIl6P/fmWz/vzNHqfRyg2J6KmBEv/XV8RkfcMgLVaiCyy03Z
	 RCHyJ8j8hza+O7ZFvoq4O0YFfQrR44N1NOUqS12Q9N4OCVnRs/RuQ1G9bZpiQgyxFDZ6V
	 re0jxd65obC8jL/5JuaWsMfNVlNALBSb1rAmZmm/UvBeVVJnOy8JfMv57bi22CZi68qFg
	 OmK6I8VexhV2ZY5x/ZuUT3vL2A3GbGhUNssVniV8fr7/n/Aj6VjgS8rnvaDThuRQPg3K+
	 75f43mk3n4i1IsMkBTEKgrgvEvgHwdZ5tIrBXefC+Uu9ohn17rZmDMoMWKK0P9fE4rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OAMoARK4;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A577260A380B
	for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 12:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A577260A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OAMoARK4
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so3798434e87.1
        for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105410; x=1793710210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=;
        b=OAMoARK4ZSXN70cesQujb0fwROmIewDLI7R7BOv8beQRvrwQ9fKRpX3Vby45OBbCxM
         JijRhamswv8ARav5DpYXy+cxZyr1R7db/XHnzW1fgpGaz+SNWlKJfUcWynd85EBdUwy4
         y0OPkENSXY1lGCqlS7hkgIJ1JWEvqgPbFwhCeuC08v+FbunM4f6SMaofawaktM97bHTg
         sPCjTQFfDQPTDQFaQqFP8G+uHpNUprtqpj30RJMedhlkrDRt3bYu+qqPOPaIMvw4uA7A
         YnjRlJvAmbDZ67ycSPL8LgC1DbRL/iuF5UHN3qDVUjCpUwUBr6ah9gpF+MTS3HHO7dHk
         iRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105410; x=1793710210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=;
        b=lMeROYoY5rz3VBwJYeVaDaA+RevIiFNTJUHV+e8Jjkcjb8EG640ZkDRzjnDe9CULte
         Hx80JpElErx5TboeF6zhnfdU6JbTaTvS70KUmdCnDDcw/Ke56wFfrIb1w+UStNUnZ6UJ
         tHVvI+7ndQF8XSgfdiKkeBb1JR1+RwzWKAbGSCcAxzwRFh1MgdvlQ6nP4vAZfAVBe6nO
         grg1/dUeeJizNEpFIAjNDgPlA/gXJpam5NvbJ+j1MjDnfqzhCbcQTmKIQIwWWKQyR83h
         K0bEgNqwYo2oOvSTjDTSIcOUgAwoMPxeSXfWjRdtZPnd++72sXils24QjMlzCUKEPw//
         pp5A==
X-Gm-Message-State: AFq9FYIytv0mBFbpYTcS482ERl2O8EcYaDhuxjxDdD80nL7aMcUMYoyy
	6BzkC9jfq7Wr8bsHvZ4bcJKpvUhu/XvhJMRMg+Bk2sapphakKdaGz/my
X-Gm-Gg: AYBFou21mLP/qPZtkTHfMpLpJg4j8fJHvWkwcxyCS1KzO5vTqsrj3RsFgCaYO4IWW3c
	wg1W0l98DcAaj96n1C7rYMfAc7XTikgXZb8j8VI72O/92w3Xi7SjX0psW1uzNcgbs3eNQuPHNX+
	BrNal9+TYaMqE/Cz/5i7EnLDjiiE8wkrL32qYGqy+BZFdT6zaE4Z4sUlfzOh3EKVMkdoMFXO66T
	pIz4WmKHttzqEVetE5FmoqwBIke3GbeCqRz7zJFmGn2G6wt+fW/FmJDkZG5alovBoqfe1Gosf9F
	ZKm+Fj4mKP9X6w43/9lFl7OdQsvzqW9O55wdbe8lcIRL0AlQxZqtneou5MEN9mUYGmoG2ctjwyF
	vNQP7NyWzCaYQatNUBqaXa0fBBSPz52qdYaP/T92//01mB9V41kEsoIEe6i9yMFUJxia8T0EWql
	Yd+UO4oTw6kAErWu1JdDfhkx27qFKImTviwpAX3av8pAX2mIZ0bLoKsjMZpcpFhLyzRUkNyhAOz
	RkjZ7zJ9tN8oNcUAnGOf5J7n78BnH0zQKhnD8tePSwdxENvcwTfOzoY8aHCw68tUC9ND66xZgKL
	mxfXHL+SmbAguDTkFFehYcLqNVNQCU8p/ztogdvUpSiQbqJ5d9FxfuYIQYsjwPLbvQ==
X-Received: by 2002:a05:6512:10ca:b0:5bf:c27b:8e52 with SMTP id 2adb3069b0e04-5bfc27b8f26mr1690144e87.65.1793105409656;
        Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v4 7/9] iio: light: opt3001: mark the interrupt handler __context_unsafe
Date: Tue, 27 Oct 2026 14:49:52 +0200
Message-ID: <20261027124954.110697-8-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

opt3001_irq() takes opt->lock only when ok_to_ignore_lock is false, and
releases it under the same test. Context analysis does not follow a
lock taken and released on a condition, so mark the handler
__context_unsafe().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/light/opt3001.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/light/opt3001.c b/drivers/iio/light/opt3001.c
index a948353014ac..cfd4a0ba9bd7 100644
--- a/drivers/iio/light/opt3001.c
+++ b/drivers/iio/light/opt3001.c
@@ -817,6 +817,7 @@ static int opt3001_configure(struct opt3001 *opt)
 }
 
 static irqreturn_t opt3001_irq(int irq, void *_iio)
+	__context_unsafe(/* lock only taken when !ok_to_ignore_lock */)
 {
 	struct iio_dev *iio = _iio;
 	struct opt3001 *opt = iio_priv(iio);
-- 
2.43.0

