Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED4878F51
	for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862522; cv=none; b=FNb5PBlvw10WDflDRv11Ewr5SxiBFKP8EL8p0QYUsHlm2XGsE8R4wOUeyGi92lGrEjeD/NPx5CFm0PcdGk1+krwC3Vs+KureY2tG8rh8aclQbJdvgFKsyVq0Su78X1Q3uDGOKQQbMtRl7yC0L8BWvmF547AO4qny1skKVGWofM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862522; c=relaxed/simple;
	bh=LAPyuo4qTGLqNiq7tRoSZMooG2Sce1BAP3WQqZkKRxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPSmTd0MS1vgkrYqPZOKGtN45O8AKma0LleYeB/2i4MYHIY/NPsQHrdolvhnUv8S29HHwxwBBh+j4UWaB7quZ6Hz1LMyg4ru6a3mpJ34N0Dueux9osVdJnzauVz/pjxRhSBKNtoI40NB3nO7Gt9hytTKX5rkNlVFwJYaZ8N4XFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RlC3eP/7; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RlC3eP/7"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so4357147a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 10:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745862520; x=1746467320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkQi3qYu1F8pnFJIyEPr/pJR3vsWi3szKANU55XaSrU=;
        b=RlC3eP/7b0Xez15DSSWsNsXjgvMRV0MVLKfK6WynIWqpBPPKMFzDF+f0pI+9dTs/Ku
         rveBNf86mzGPup3oGQXEQy3ZkH/v47YTWKM17Wv5lIaKmTayDjgfNGnl3JflZil5wBP9
         nJlGjrHFu8HVr0PaQTpAHS37dbH7eztBptD08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862520; x=1746467320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkQi3qYu1F8pnFJIyEPr/pJR3vsWi3szKANU55XaSrU=;
        b=mA+7lEfVLRnj8zDJoOCD7I/YZWqMibBI5JVJB5WFZW3khNUd+Tz9t7vnsOc/dvDP9e
         WxdTga3D5MbySj6/qsX1bF+Y/sOD3C4JrhwIf8YzLGEk2VU0Us1/QMIKuncsyGFzovg1
         IUhoAmfK03mJB/XkoyZrE7ExbfhYN7sMRrSxh6F0AYgnhGk4C86IPgqAniJVV/FpjmVx
         tt/Mq5BO0xf4Z/HQz56KpjQfWUj7xTc3DR7KQ0ajgLJzEIEfkAycHgFO+vSwKE7gqbjX
         Z3P8Md9K0Z1L9TuxwGOGNYO83vt6y5Fz6CJQ6d1s6paTAAsI/N+VX8tTE0uM6hlO9HJs
         78mw==
X-Forwarded-Encrypted: i=1; AJvYcCX9BLRTVw0v9aJh3NZ992uzo6aoc4zZP9RQOBIXutEbn0QFWd5PAHpvuAApqoQ5ZkXk1T9uBkaaVkCTne+SO04=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoVVNfIIpIpUaErS5eU3RBAuXE8/YcpHHH02ub6gi40K+Wm67g
	bDFK8pTvFpvsNhdgoBawfcU8OBQangITOccHjHNiprW7M8pjz3HbAf0jPUqxiw==
X-Gm-Gg: ASbGncuZzAdXbPEP3aoz0wofdI6qJGT0H7Wd8aHDHfyT30aS16ubfC47tw0BLQr+tfG
	wWwLwKr2oD1C5lgcxX+BuK0wzJUNR9zCGTHSjOU44ylq1ISy7vWbp0K4HnLCH40rdEb240bdKjZ
	FuwrEgPwLFpbTxa5k8imXOUhQrlwB+qR41WtgCsNcJXIC/MD0o+xyWXjkR8bovFD9OAXLw8QsHa
	c154Yn8lVoHKnCxFEmYsCDGApa/iJbvyCj+wSCrSe8OuYyBS5QdB9vhGIn13bmTa26YlfLdPsFu
	U4Xog5e0u66MVBP+G+5ua+2yJHseGNvGHZhYVKH8FzNh3xN16QD5SKMiFHrdi3jAAayz6ZDsjsv
	R3ZyjbR4hFA+7F9YoRWjJ48X0hyh0Rg==
X-Google-Smtp-Source: AGHT+IHo79Xwon0l3qUnRl+ZO2KJhCGKB28PjUYLLf+CEUhzlw2T5PW/6v6fBq/mxNwFTJI3f94TpQ==
X-Received: by 2002:a05:6a20:e68b:b0:1f5:8a03:ea22 with SMTP id adf61e73a8af0-2045b99ba90mr16427916637.33.1745862520239;
        Mon, 28 Apr 2025 10:48:40 -0700 (PDT)
Received: from bleungmegatop.c.googlers.com.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a14asm8513987b3a.131.2025.04.28.10.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:48:39 -0700 (PDT)
From: Benson Leung <bleung@chromium.org>
To: abhishekpandit@chromium.org,
	jthies@google.com,
	akuchynski@chromium.org,
	tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: sukoo@google.com,
	bleung@google.com,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH v2] platform/chrome: cros_ec_typec: Set Pin Assignment E in DP PORT VDO
Date: Mon, 28 Apr 2025 17:48:28 +0000
Message-ID: <20250428174828.13939-1-bleung@chromium.org>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
In-Reply-To: <20250426024810.3876884-1-bleung@chromium.org>
References: <20250426024810.3876884-1-bleung@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pin C and D are used on C-to-C cable applications including docks,
and for USB-C adapters that convert from DP over USB-C to other
video standards.

Pin Assignment E is intended to be used with adapter from USB-C to DP
plugs or receptacles.

All Chromebook USB-C DFPs support DisplayPort Alternate Mode as the DP
Source with support for all 3 pin assignments. Pin Assignment E is required
in order to support if the user attaches a Pin E C-to-DP cable.

Without this, the displayport.c alt mode driver will error out of
dp_altmode_probe with an -ENODEV, as it cannot find a compatible matching
pin assignment between the DFP_D and UFP_D.

Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport support")

Signed-off-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Jameson Thies <jthies@google.com>
Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Notes:
    v2 - Add Fixes to commit message.

 drivers/platform/chrome/cros_ec_typec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index d2228720991f..7678e3d05fd3 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -22,8 +22,10 @@
 
 #define DRV_NAME "cros-ec-typec"
 
-#define DP_PORT_VDO	(DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D)) | \
-				DP_CAP_DFP_D | DP_CAP_RECEPTACLE)
+#define DP_PORT_VDO	(DP_CAP_DFP_D | DP_CAP_RECEPTACLE | \
+			 DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | \
+						BIT(DP_PIN_ASSIGN_D) | \
+						BIT(DP_PIN_ASSIGN_E)))
 
 static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
 {
-- 
2.49.0.901.g37484f566f-goog

