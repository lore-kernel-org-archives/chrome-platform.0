Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432754;
	b=4WqjLmJEGV1dj0gNORh4uop4P+REmBk6Fvv4MS7Uomqe24OUWguRH6IiK7K+p6DPpITj
	 VvcRSKq7T5D4suqJgaZfRBSHj3IECDznVMjz+ILUnuBnyDBgsTKgeUdCjyqIvOAXiCpHL
	 tfxKBDzESWY6Ko0ryfH1ZWAh3xxdqs7dCmIvSAj7DKARn7X8NdfOsP3qKNWojiUXPUxY7
	 iePRdQxzlWNfCsmNxb+zpOHNsmHMunP6VXdLKobaeA2Iz9yiukk0IPhYr8TDLhqJkfRff
	 YMC69VkZ62UDeSMuLaguUEegLblcVW4+Qy+D/pUlQbIehkXRZgbL8V8beYu1tTKR0rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=M9BurEdxaULfUy86Tcm7upcSP8lXl15O4kiGDMc4hME=;
	b=H6XOC2HEbIgcCcpCqr9+P4S1ybrnewq0bIs4yuW4TunozKWHVfiEyc9ze1bYBA9pIDQG
	 Z3wOjvUlumrMKwkDl6qhjMDMPg+vbIY1N6HrSvGGXJW47Swb5klwjRPvJ7sanM+TeRxkf
	 piEqalUPJtXon4QFZVsgqFMa3FtS2F0/J1L6xiiLJFoXDDGFAXccEQN/ZIRpDcxbEnl4T
	 J4E3NWGLK9CCpxT7tnduNMeo7xvcnipBVUoyu+2mt1Mzo6lmqNrRajQcclxmTsbvVsmRj
	 l4NoJjGpoW96G5u3Lo0xwkGV+HqZgaJBDr1BtqL1KQBsJsQgjiqCNeuigrewe/4LXZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mYLQ1kdS;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995EE60A2600
	for <chrome-platform@lists.linux.dev>; Mon, 23 Nov 2026 11:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 995EE60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mYLQ1kdS
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so29110255e9.0
        for <chrome-platform@lists.linux.dev>; Mon, 23 Nov 2026 03:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432752; x=1796037552; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M9BurEdxaULfUy86Tcm7upcSP8lXl15O4kiGDMc4hME=;
        b=mYLQ1kdSLw4Z+KEtRI70fo8gzdeTR2dqwv6KLrdCyeBjosFIVNrpQX4pTEXQUGcUh0
         OUghTOD1bTI1AJS59PXoSdDOguzLo9KP63JwDHcwhLtZ48INMx9uv88WvcVruECYSxDt
         7dBZGKQb7vF8VoZ3XQsJVL/C104gkqqV9Iny63IQdk3uecqUFXWErpn+99gw1K1YSMOi
         mbveIq/Wj1c/kcBvFQLFCVea//mS5LT6UuEXxEMLQRaNM50nhfDPqnQcs5wtLkLhrGDf
         x1dybilMk80uZA2I1HMQM4SylIS/De2dpAX08/9eNFfWAWwLIofA/I5La/p+CS5CbJcK
         TUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432752; x=1796037552;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9BurEdxaULfUy86Tcm7upcSP8lXl15O4kiGDMc4hME=;
        b=WhEQMcZQ0mordDJlAbZ04fxYpHFhLrhAYb3y4kewOav8B0F5lDY76jnfnGr5CIX7Og
         upOpMWLv69iLED2IntBS7xZ34J1UB4HYeJ8MGUM3TnM6XLzW01YJoOBJ/5rcqf9XWkua
         Jua1iNrdkHIYYXLycoxR3mHYg7i3KkIZWJi2zJozR0eCsQlnOFkwiCug75blztFM3Lhs
         9rZsQP4rQrSGOSQUOVLXbAQBCk4EmyNZoUkpULFH25m1CeTkc/60Ukl4tugxn4xj2QHu
         83carcIjJIgW2tXnfvHMsXg1a7/VziQJ29ca4YQOJ9B2pKwlkHonVnS7XheEBnOKyr5j
         XJMg==
X-Forwarded-Encrypted: i=1; AL+hErH//YFFY2isRNq3qsQpwRN0/sPEGf4A83qM9vahgQbIskHauqunKoSommi2CWCixknneonhjkIeME8aKbqWvjY=@lists.linux.dev
X-Gm-Message-State: APuU4Z8pFDqa9tkiYxm0ffq7Xah07YZJIAvGf0Od8PaRBDw5o+K0JF39
	yS6gz/Ketq9FNLTTpfHevZDrlcOiFQ12pccj0OCzhf7TsRapRp9wVCQCaD91fLaKCOg=
X-Gm-Gg: AZFdTZeSOeSpkTQ8xkJJd/+KUoW9aWmSQtGCYG54QvnpgKeSgf8P68QRNLaINe4Jpav
	atJckrI5x2UahsypM05oheBKVQ/tV7Zset29xH5oJOztmZ2Ix7p+9sMCRN/5uriaap4rHs98ylS
	5FpuBEb7v3rFqqCNZWWud3n7g/z3cvVNK3h3kEQ/n/ugdPRZhG3dCrAlTKNCqIZwU38l+2qfVsz
	yGklU9svZRqnAVELZHSTe9J95jCHF2CbPohAfaPA8OBj79ExbU775u6PfTiljCcsKTsUHfq1/AL
	znVfVm4fyPqEHD4AOYa7RjMT9yK/PX1Xpjhbtuqqn7YXzu96eqfB1G/128cvHJxdLAHzihKitlP
	7X2lTKu16U7eavmHohVjs2xfZqiOqLyvhRs4YDzENYnHH+hQeIaWL3QDh8AkGSf8xo4IZD84oZF
	y/4u2KbuEE82MkDwEzossDjqHbDOh7YFjtUTet0eaHlXTcY3OkhSbG4NFB6oI09pOsJEaANYL9E
	BX2PoySp17XZCoxmB9LfuUs13j49ODAxTgQBxOoFS3c+szCxmPv5g8whAP5E9k351FpotZqavUU
	9lY0drMBIoT0GCrm1P92JiFthnCqU+1eyGMVXKrnbjFRhQhhvb6Xw/8L3u+thX4Wo+nWyB+Cwoo
	MuA+em2z/5O9yhP+3
X-Received: by 2002:a05:600c:4e8e:b0:4ba:59fa:510e with SMTP id 5b1f17b1804b1-4bb8893014dmr230811345e9.23.1795432751939;
        Mon, 23 Nov 2026 03:19:11 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906cdcc1sm160681095e9.2.2026.11.23.03.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:10 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 08/17] mfd: Drop unused assignment of platform_device_id driver data
Date: Mon, 23 Nov 2026 12:18:06 +0100
Message-ID:  <6d088972de962cd3b8a22926800e36defd268d97.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=OvFq0jqcix+nwy/hTUrsl7qFm0ROsXuuz2q1RVingjQ=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGsEIPvISAODgKyfpgbjFnyiCAHcQ7IbFHzgEvRZzaz3yy47u YkBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJrBCD7AAoJEI+A+1h9Ev5OguoH/1w9 aQiu905LCob4dh8+UJ0quimfHVX9xW7+i57G0S8G2aVJctqf2euVKBSoxeeSo8zEke4pt4akQS6 fJ51B0cHc8thdTMyKEvvqix6mrX+xyKcVQqmq9lHk/m6n71IDFR+XBKvle9oQJaeZnQGiry1mC5 9hKGlxP9dWv4btXVIModwmGhL+nQLu27g8zlS4yCW3JbqOHO2j9R3gWD6EBfus+x4M1eQaAv6Zo x5vYa6z7z7lbQ5+suCKrVLirWylLU7XYuzMFyPb5zxB6Sf+qTBKk9cJNzgsawDWKCbigX8sw4iU BQpqVjVQ84v/zNG4tyEpOu3AkqJKnJGD/7SiVm4=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b804f7..96aac158fd8b 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index e2f6315f7da8..816ddfe1584a 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -327,7 +327,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.47.3

