Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854041;
	b=oV0o17IsCqiUcppvtUe+m1iGd5a7/vdvWZ0txmNK6idLtYn+pyiLc+Fi6oklEqR0M+ja
	 xSJCa0IA4UHDd9SOtetORmolnANij1huY7XyHArB81Lv9OFyHBrsApgrpGmgoDw6teCbK
	 z/vcpOFhAI5fEGFN4aOGgM66ro/PrOrj/XdpQ+OmeA9Y7wwJFgV24xnVINNn87Ebk5f05
	 8y1r+1CcPKUWN4SAoc2jbAedboSBGHBTPgBmghgiDA3BJLNLj0U2Ccldb6mBmAfRkpZrc
	 aU6KIBmUStNJOp6xkUZLxC9iL/nJH7rU/SJWb1e/0FhF2/TXF5kFdJhtEqGRg+3nyHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GyuaTqMYNmS5JsviQOab4u/oXrUKmx3oHJ66xNoxHJw=;
	b=Xcnga5MZY/YutqbRuFT2IxTcz7G7+3es1JNptiOMGu5c3VzcneK+KGbfwpsqTsY72chJ
	 uUz9cvWwbFUHTdnJ60XtU4hH5Lqk1lw1s7hZj86KFC/h9xhqtBycjLg2+7JMAkyH4ojf4
	 1rIU1+GAiACFgOE9L7nsRwXHHtCSlvYrqLwNshDpK5NevSCPKj5gRV1Zo4YHm+Uhb2yEF
	 OtwTI6m5kEobKaSs4eLXtzAZ22p+7MljdEC5dZAPE5UekJk8LweUry5E+W/VZg65HNKvd
	 MKWzDp5gYz5O+OAmXA+bIHGBfLSWxrfqJKRdWO1DvfKFoOVOyGfEGFiZU77slRIWUVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG8i2Gti;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3179606A330
	for <chrome-platform@lists.linux.dev>; Thu,  5 Nov 2026 04:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3179606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG8i2Gti
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36d6765756fso1536501eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 04 Nov 2026 20:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793854040; x=1794458840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GyuaTqMYNmS5JsviQOab4u/oXrUKmx3oHJ66xNoxHJw=;
        b=AG8i2GtioQKY8/uoDVXz2BoD8yOU45gymKoce5HcGYZtDsGFUIFGpOa1HScJdWNOSO
         AI/kZAn7AGrQasNeZDElXiVotkDvNRyi0Arj3/1huPyK/JhF/SL4EBjTP+FD/9eUu2Ne
         m1rW+edPDtXp7NvBTfAVu1PJRe+Z6APbJzw0VRYZbFB+0+sJPcU4A6TF0yFn+GNvpmsu
         r1qfRdm65OJAElmRMWJW5KtPqRnhzIDuxQw6dXmsyJgtwcP6h5Z4EDopPJdGKDGq2yn7
         MA6xn81Wnr9cU7Nkg8YLe9PdWVyzB112PNWxLCUPH+m7wvdx5jauNWt3xUCe03thWdr3
         HuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854040; x=1794458840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyuaTqMYNmS5JsviQOab4u/oXrUKmx3oHJ66xNoxHJw=;
        b=STfFkIFDJULUG6NThBWSHZdX3NWFRHG3jF+ZPr1kW52M1xtJJ1FCR5l/1whwnO342M
         zC12OWM8iU/1IsmavRfpur+gzEeeBlm2tjVK4m7eG22udAGTK/5rASHwsBDf+qXOPQfl
         j+f+ddTAkS09KBoxlxzlTpn1qcg59vOMeXVlL34pBXvEve289UHnR92y/MnjkaOurBK4
         Dgzm08cgl4IrT9f1PwoH8ytgMKXtG4oVaTujaQNCGo3Sz7ffxhx1XlwArID7ckh2Atow
         F0nTeRyF53D5nhzdi9ZVk279YQqfhC/Eoms1muy9JJgIVWD/jNONzmX1vrZYoFCtFNZ4
         XUuQ==
X-Gm-Message-State: APuU4Z8mo3xelWzARDOrZ7rMZ3xOBzOw4G330uRSQOCFa0OeE6aAhzVp
	n1E2Yu2HuR86pMEGdM+KAIOl7sU5OMP8ICJISR0KSe3smSIarTrKVhkWgIqoELp/Bw==
X-Gm-Gg: AYBFou1+dEU7eIGvcBbspw4THixiKqs+1rY+c6Q/dTbiORa5lhH+65opBhIIeOQf8J8
	NZbBrPhDVP1sn2oKQV9HdR0gvW7H6D11tAbA5t6vfcOXAJRHdt1fEshGI5SOL/YZjHC0BHUqLhC
	EcXOO0wpei4x06Ga5IFJSXa6ttl2UevZb4FfB7QGjONBvogaXjmj7v6V5sfACK9ddGL4QtOMsch
	KiWqZsl3weXa+iP8Xsu26+9cl2jL/ai5LjUEGqmehEVktZm40BhbKZDqUMwy+FueSUU0+KQRufK
	/aBYNUX323k1Avx6qFjtlPv7bpyyaIFxY/MV7pmLzWGvMF1QNDc4uE9KU9ak4msjimcFKS+xks4
	+fI2W2WfwYCqbpWQMaU7XaRSfkbKqQ6POz8mXYWDRZBXuzc+u5hoirrHm0ffagaxk3dhIF1qoFe
	tEe0s7DBYbigRnSIuZOoArnNzv5LtNU/vAYqk7btmRG81tAGhECdmrj9mn4I/NsZMzxmdqd2N+w
	bycYrpz/aX6vnyJYHTL/ecb44Rdj3vRcr74qcrHWWQiKoHgIsgMW0QDJLYp1TFyQaxrw3Vhfv5D
	y4LAIRWc6gIxayTeHW9W9JX6pglWOfK4JMUI1H71o+BAJjRODFEO1iV0JUN6bJFtrY5v
X-Received: by 2002:a05:7300:3aa2:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36cbdf9be3bmr5924825eec.28.1793854039490;
        Wed, 04 Nov 2026 20:47:19 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a599:d119:deec:193f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm13076247eec.13.2026.11.04.20.47.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 20:47:19 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: chrome-platform@lists.linux.dev
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nick Crews <ncrews@chromium.org>
Subject: [PATCH] platform/chrome: wilco_ec: Fix device reference leak on open failure
Date: Thu,  5 Nov 2026 12:47:12 +0800
Message-ID: <rc-review-20261103-vc-85-d1e3d35e7c31@gmail.com>
X-Mailer: git-send-email 2.50.1
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

telem_open() takes a reference to dev_data->dev before allocating
the session. If that allocation fails, it returns -ENOMEM without
dropping the reference. Since release is not called after a failed
open, the device data remains pinned after removal.

Drop the reference on the allocation failure path, after restoring
the available flag. Keeping the put after that final access avoids
touching dev_data if the put invokes telem_device_free().

Fixes: 1210d1e6bad1 ("platform/chrome: wilco_ec: Add telemetry char device interface")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance: Codex (LLM) for ownership analysis, code and changelog.

 drivers/platform/chrome/wilco_ec/telemetry.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/wilco_ec/telemetry.c b/drivers/platform/chrome/wilco_ec/telemetry.c
index 45be318b05f6..79fcc46e4417 100644
--- a/drivers/platform/chrome/wilco_ec/telemetry.c
+++ b/drivers/platform/chrome/wilco_ec/telemetry.c
@@ -250,6 +250,7 @@ static int telem_open(struct inode *inode, struct file *filp)
 	sess_data = kzalloc_obj(*sess_data);
 	if (!sess_data) {
 		atomic_set(&dev_data->available, 1);
+		put_device(&dev_data->dev);
 		return -ENOMEM;
 	}
 	sess_data->dev_data = dev_data;

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
