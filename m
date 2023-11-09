Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0883CD2ED
	for <chrome-platform@lists.linux.dev>; Thu,  9 Nov 2023 18:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpKcbjS3"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6bcdfcde944so290216b3a.1
        for <chrome-platform@lists.linux.dev>; Thu, 09 Nov 2023 10:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699556103; x=1700160903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/asJ9Dj+3Cx6KmENE4+zs0bPzpX4pHWbGWWiop9m2C8=;
        b=MpKcbjS3emrsN05eGyAnS5ZrXvqGtTfDOTU2AIDnSMBC5sZs9MsBFcYBJ1j/omOAuy
         ngo4xivisk8FXxFsSGAMGIF/4njPyEqkN7SFOHU5z0mxQylR8ZkseETguD0PGcyVIux/
         gf3yiMMc+c8gP3yJL5zOE/P6YKPp3rr4qLmWyCGmnzs8XHbvMvBGUQ170Sz5bfwV4dLJ
         QGHqGHzyiIRfjLJaAJ4m8+Ipy0dQRriweQliw0niVnLcsWy5G8d16ZXaAC/DHtQGy129
         gDRcFfBBYEshkFZ4X6mFZ3NgI8dm8ysZ0WZRdYLrScKC3MskOXRItsTqnGmuAugA2j2P
         WeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699556103; x=1700160903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/asJ9Dj+3Cx6KmENE4+zs0bPzpX4pHWbGWWiop9m2C8=;
        b=l7pO0nBqxA1GKnzDg6HTaHMP980GC/O6Z2KGjVX4djM8BHADJt1Mk9I12nst1zRb7u
         NU0+efP6dJg1Mx6yfNIzqnc8vL8tPPLNAyWaNACQ/5m5TBbO6yx8hNiUqYVC8aX9N47d
         SMqmDlTxTDYuMJyHgWPGgTM38j2ZK/LKF7GYIBf50NnyuoyJdlO7BPFCBT2P20ttOgss
         /szMY4ZX3w+EwIRTAXD4m9xnwysGIt+ASQaaaBv38Tjz6eL0gRbx2mAt+IRqLNk0BKkE
         pLqz8ZDYjLt3M2Y/80kpZC98xiEvhPDUlyjTEmRHMBdlQ+FrGSlcK4i62+txgaq2Z09V
         6HRw==
X-Gm-Message-State: AOJu0YxDof4Py55dcPj9hx01oUDzwIDM+WmYR8rCiXccnn/+uxJw9Fnb
	msG5NC5Nwj5w6s/CBDA47NE=
X-Google-Smtp-Source: AGHT+IEBJK90gDyvFSF15Zd7y9xNPqkhfxe80VneNX35DCeNzc+cf8p1xhimbg9FPPlfKaG3sC+8mA==
X-Received: by 2002:a05:6a21:329b:b0:133:6e3d:68cd with SMTP id yt27-20020a056a21329b00b001336e3d68cdmr7081305pzb.3.1699556103276;
        Thu, 09 Nov 2023 10:55:03 -0800 (PST)
Received: from localhost.localdomain ([140.116.154.65])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902d71300b001c61921d4d2sm3821837ply.302.2023.11.09.10.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 10:55:02 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: groeck@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 3/7] platform/chrome: Fix typo 'noone' in comment
Date: Fri, 10 Nov 2023 02:54:35 +0800
Message-Id: <20231109185439.1535962-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231109185439.1535962-1-visitorckw@gmail.com>
References: <20231109185439.1535962-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'noone' with 'no one' in the comment.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index ee1c3124d31a..85764e62cbe4 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -103,7 +103,7 @@ EXPORT_SYMBOL_GPL(cros_ec_sensorhub_unregister_push_data);
  * @sensorhub: Sensor Hub object
  * @on: true when events are requested.
  *
- * To be called before sleeping or when noone is listening.
+ * To be called before sleeping or when no one is listening.
  * Return: 0 on success, or an error when we can not communicate with the EC.
  *
  */
-- 
2.25.1

