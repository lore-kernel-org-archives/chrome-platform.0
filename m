Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385881B87C9
	for <chrome-platform@lists.linux.dev>; Sun, 22 Feb 2026 00:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771720651; cv=none; b=antSgxuEmOIYKj5zLW71xjIGyIoveL0MPt49pRYy1oRR4PEERiJeD0n0z/hnxKFnstFM6tG+aLpYgQXAkatEwIm+ZAf40bJj1DBKfxWjop1HhqoKi9FqBz+yXigIe3kyIcNg7C7NutAtQHjOSnY18/2EtvBhruZ/XHgaB1VPsqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771720651; c=relaxed/simple;
	bh=79Tv9tRoMEQ8y2QqVKokbi5C0O0eIUWbIEJdGGLSgh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIPjtlz05PLUxb3uWfRtVGR6FpU5OB63IcNADva9KKNb546oD2/HQepiIzJBTN8oq5x8Se0i6JudkbEyOY03zvBVRDVupwTVZenO//BISufhoIl8izM7pUWgndLB0FRPgBxiqvOPLcwvRSECeniaPuTyh8JC/MqLmnXqldcj8Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVv72A23; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVv72A23"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12721cd256bso3643306c88.1
        for <chrome-platform@lists.linux.dev>; Sat, 21 Feb 2026 16:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771720649; x=1772325449; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2zPNTCZUxKLns6t4TdoBG+3JsE9yOyBYeDgC9tcG8I=;
        b=IVv72A23PUZr8UcYuQUjJrFqUAkYVQutRt05eK5trQtgL9H7U7Z76jlm0fL9ksxEw1
         DtJuue86yYWtjvozMyUUxKy+D6skAmty+qFTNDzdIlfgITBVgxU8AzqnTIkYktTZFTgv
         b+zSjklwh70cPJJFJ1iIDOrDHOn6WPjQqUykFf2sasT9ZZ5AtWIP45lsSfWvTaktH1VP
         TCRG0BB5hrb15E0KM2tXqzNOSTsu4pgGvUlPvlXS00oEhb/LlVYui7mADmooyMcwiPi2
         QNvijzoXqufONuMtqPKNZKKsRQ2yXmTZO7myA7r21JZJq60jPRxRbW8VM2LsI2tgsqxi
         padw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771720649; x=1772325449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F2zPNTCZUxKLns6t4TdoBG+3JsE9yOyBYeDgC9tcG8I=;
        b=EmcZFDXOgmXDaknyud+wtltFtN8yrReG/+q//QXjIF4obNE6DsSAgm6Bf5MCi7uDbH
         nDXz2pGza3hAN9QiAwfduMJyXedlllsDMGiFxBMmDYt0PL47dt3vmlBjOBo63Vcfygak
         qZjB461SqkGdOO/tDjJmW1e66yE4KOy/QvAqb0OnmLJx+CeK4C/2fje+uxgM0RC8OXsW
         P/tGu9gYo5pU7l+XWBcriAGwckeEw4NmVe05zOaV5TPjz1nD8shYnHIgtc+ekY5+qfAH
         gOyCInBNUKT3uPR91FtpZI24OPBV+Hu/7oxv9ky4CjEUINmGnta0Yje62qFDYG/12zHb
         yQuA==
X-Forwarded-Encrypted: i=1; AJvYcCU4IPOlk4PSKyxycLrSDN9JEVXb/VrYOYlu7IiBYf3vzOq2kGatAeTK8+LJ0DIHgwpzfPw4S1Uf0/+7yVJ0gRs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4CF2nGwBc0fJSOEIXKahunVOAnRx3UoCS2sBjWG2TvPYwZ5ZN
	1EcqPkT4SVj8oq5WdfTUuYT9Lttb6GjZ8Bkv/M47bDri5Y55n7MYZHRa
X-Gm-Gg: AZuq6aJLVEEDvD9/wJNWlljDis00tf8OpI1now6oO7NSdAYVKJJdYXQ7fdy1k68VxYr
	/DCZFuEkKhqP2mOOTvYZqUz/yQ/U0TcpIEfY4eKbA+bI6zb9QAh/HA5lGJNPs2pKwJ6vgAIqmvY
	aoszeVO9wcGoaZ8th5w/k/fFKh7KtYKkYDz9v3CMjCydbZxNbyGpamHVqQxZWtciJuDvwDfKjoC
	1Bme/lB6qimZrBNY5rdG6ejc8ymkOkDBd3+RlT82t4ZGzM7j4VKthI4ZLEgbuPtTpHQomGmn6fN
	N8oammdbM8YMUg4LZifsCmB5N7yC647dp970qoHJBjARDzXvSIXDetaTwf8bJOn3oUufeioCGUI
	TttN+9COb5sZuZUdX+iepy2/G7zTVrKqfgpw2zeBNzp0aOWJWNhtckYkXggjIjzEjIQ0qYeiHCg
	EAQrRe1cTSFAxN4+E2JNXiSMK0KqBykv+oJ1lqwJSidaatpwjkY6ZKL/JbpinMRzYmwr4jd2UbH
	o9/Ny5IqNWia46nXT4H6ALJ
X-Received: by 2002:a05:7022:4182:b0:11b:d561:bc16 with SMTP id a92af1059eb24-1276ad18725mr1911089c88.22.1771720649210;
        Sat, 21 Feb 2026 16:37:29 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:73d:b075:516c:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc167d3sm2383191eec.24.2026.02.21.16.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 16:37:28 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] Input: cros_ec_keyb - do not allocate keyboard state separately
Date: Sat, 21 Feb 2026 16:37:14 -0800
Message-ID: <20260222003717.471977-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.53.0.345.g96ddfc5eaa-goog
In-Reply-To: <20260222003717.471977-1-dmitry.torokhov@gmail.com>
References: <20260222003717.471977-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we know the upper bound for the number of columnts, and know
that it is pretty small, there is no point in allocating it separately.
We are wasting more memory tracking the allocations.

Embed valid_keys and old_kb_state directly into cros_ec_keyb structure.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/cros_ec_keyb.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 1b4ee30e1998..02176aee0530 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -59,8 +59,8 @@ struct cros_ec_keyb {
 	unsigned int cols;
 	int row_shift;
 	bool ghost_filter;
-	u8 *valid_keys;
-	u8 *old_kb_state;
+	u8 valid_keys[CROS_EC_KEYBOARD_COLS_MAX];
+	u8 old_kb_state[CROS_EC_KEYBOARD_COLS_MAX];
 
 	struct device *dev;
 	struct cros_ec_device *ec;
@@ -750,14 +750,6 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 		return -EINVAL;
 	}
 
-	ckdev->valid_keys = devm_kzalloc(dev, ckdev->cols, GFP_KERNEL);
-	if (!ckdev->valid_keys)
-		return -ENOMEM;
-
-	ckdev->old_kb_state = devm_kzalloc(dev, ckdev->cols, GFP_KERNEL);
-	if (!ckdev->old_kb_state)
-		return -ENOMEM;
-
 	/*
 	 * We call the keyboard matrix 'input0'. Allocate phys before input
 	 * dev, to ensure correct tear-down ordering.
-- 
2.53.0.345.g96ddfc5eaa-goog

