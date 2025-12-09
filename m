Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955C527F759
	for <chrome-platform@lists.linux.dev>; Tue,  9 Dec 2025 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765295236; cv=none; b=WNbu8b2MwkGgFQhz/L944VnI3yNfsC+rSNg7N9C7H0pXq7y/nHg7jVutwow1VE34VnJPoqOrAnuA4nr+v3XalqHG9nGTrI2YXX9gsTO+Qve0gjuKFSWi37PleJoYyFdbBdb0YUnSXH2RZyTMjcI2op0V/VtVojyK/BHHJCxtow0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765295236; c=relaxed/simple;
	bh=SSTQV71zhH+KAIMdkOHqBQujgdzOTQUnEVzh22O3y1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ID0hCb7XrSUaGoeRgzUncVZ8vqRQ5qtqFiBBJ+mLuTYW7prONg4oeX+Yaw+t+c03OHAOO9kALWNOO/27QlqvvtDKngLYtqhcPsLbEXV1ILD2fJakqLoWCDl3QZwE4MP0TthvtwuxobSDs+cZCeuxhupy5KkAqb1pmOJeed57jQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GiJ9Njq2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GiJ9Njq2"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775ae77516so70009215e9.1
        for <chrome-platform@lists.linux.dev>; Tue, 09 Dec 2025 07:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765295233; x=1765900033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nijc6TapEVx1m//kz19HJEsLmLHghSeoAA0KmTIDep4=;
        b=GiJ9Njq2dy9+6FP363RTfoftlKulVrrPNp7IGdTYlGBUb4W2Pt6wmLQYOrOzJo3BLT
         FW6KCG8y5N69ClC5mAKj4MlRpxmB4GvwfabC75m7PQ5Y5bUeNslsId2+STHxTeLyndtm
         AAkWygQfkGzNYkn/dc937WhT9Bq8HERukGNcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765295233; x=1765900033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nijc6TapEVx1m//kz19HJEsLmLHghSeoAA0KmTIDep4=;
        b=nbn2ZxyrLqxEa3TLwSQNr+jD2MtnI4dVEtWPX3YGCBdjZx99hSmxhxtjahWme2wipB
         ryoj5vXx4zyr09EYhVKS6JOOognH5LcDTTpFU1ZnwJYQG11w65oircD/FqpSB/ymHT3Y
         34FLsbVfxNbzFRkk4lo0j033NIgBvvN5ZfM3wo1p5lli/cFtEZXl8I7LrieOMNPAcwnv
         QM5n+GH4e2CMDPxo9rY4BQiQ5b9hZe4ZDFYf2g2KuJ6iNOgZQMGOUiM/7XCld07/kp9o
         orXHrAB82hxgM7CqiliQ9OObGT/KlsxXmJFahc5tdg3YyU1xWYhiGLKu4P4YKHAPgqGA
         Yo9w==
X-Forwarded-Encrypted: i=1; AJvYcCVQY4b5h0m0nu1GPvwxR0S9p9x8sQu1lDjvYfUHr72Q/Ginb3+XJzzrP0rFuBdhCOQvXZKtGE8p+jbg0Id5LZY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAWVTaDR6e7ZB4m92H7YBt60UVCzn7KHGEY/1P9GsVQCNW2637
	2oRdnwLmiuod5Ld8XTt0KrpLqsL7DGNHs4eE4SOf1l2eJF6LDec7IhE+jXmZYj3XFQ==
X-Gm-Gg: AY/fxX7S8p9XZDgG1uOHRBhZBjEuMab88MZhJoFmRzn3eaVHljvaUQXIIwzJa15rfdX
	qJmaNHg/Oc2zGwd8usudhhDzb7M97iajWv8lohQRno+/pZhAlQ1tl+KgcQARtCTij57S3YTh23Q
	XaMmWKvbV8Gc571cs2XoBT0Nb2wY6oxnItBeQnj4swfuidfDQqPYAUQgCzaKv/MULVhCdUchoDj
	umhSAz1gs5pAxeDvvOIxjC1eFsxFQSO3ifNwu81VfjJNJvcCs2mBDsY4S09P+HcvaO9ufHsshTw
	0yejC8bHpdtKSfiIgrAogikT0OZKT/z249mZoR6IA3gNsaIvckyH6SMiaR0CntzenCGvtOERbyT
	EyEfat/yQnmjYsF/HJI4KxEcUR3CnzkecDYxssGfwdBeczw4U/tjwq/tq88HauWorWQLFYadPxV
	ssh2w7R62C20r22oM=
X-Google-Smtp-Source: AGHT+IFIwxIRvtKdP7oP+tHCC5AXu9N6uYSmNB+//1Ldk1GFkhn80JY7zzQCa3PkorTGapSGbkUsHA==
X-Received: by 2002:a05:6000:4027:b0:42b:3ed2:c079 with SMTP id ffacd0b85a97d-42f89f897dcmr11220121f8f.48.1765295232875;
        Tue, 09 Dec 2025 07:47:12 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353c9esm31097881f8f.40.2025.12.09.07.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:47:12 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.orga
Subject: [PATCH v1 1/3] Input: cros_ec_keyb: clarify key event error message
Date: Tue,  9 Dec 2025 15:47:04 +0000
Message-ID: <20251209154706.529784-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
In-Reply-To: <20251209154706.529784-1-fabiobaltieri@chromium.org>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reword one of the key event error messages to clarify its meaning: it's
not necessarily an incomplete message, more of a mismatch length.
Clarify that and log the expected and received length too.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
 drivers/input/keyboard/cros_ec_keyb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 1c6b0461dc35..2822c592880b 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -269,7 +269,8 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
 
 		if (ckdev->ec->event_size != ckdev->cols) {
 			dev_err(ckdev->dev,
-				"Discarded incomplete key matrix event.\n");
+				"Discarded key matrix event, unexpected length: %d != %d\n",
+				ckdev->ec->event_size, ckdev->cols);
 			return NOTIFY_OK;
 		}
 
-- 
2.52.0.223.gf5cc29aaa4-goog

