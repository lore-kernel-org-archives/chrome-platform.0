Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976133016E7
	for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988412; cv=none; b=NeA7IOuwPmOIWC12lpQCBShdhS/SHYpGSINuSiU1Ae/VIhPzvpXhvE5BUL4lqIKPRnWwV/GW+k53ScEcbvKiNJoNG+HgyV3y/cFrwMePr1/eHWyQojQYbut3J2uq8ABjWfYieN04Zt0UkHfDO53thwpb7igHV4LjJVtmq0Je7v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988412; c=relaxed/simple;
	bh=AfTRfVR6FqansvGC0ZbCDHLMi4UPrZY5zWFqtR4JCOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jo53LWpBMeSd+G4kyxMpLsexybR52ZtW9N/3DIpOJgir550UuPahif9ovQAmjxrKelNSFTnoNG/VYyA2kt/yc0QVhQQb4z6prNtmSQq1xgMyWWnlNDGMjRYbV6k6PtPs0QLfkDw+FBdOEGmSSWpZsO0lzw1y5uFLst/DApwJDHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VIvFdX37; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VIvFdX37"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so725435366b.3
        for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 04:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763988409; x=1764593209; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcNKygSH663Cq7ccIPy1yee59jsF3OcZatBL8KE+sKc=;
        b=VIvFdX371A4v7MKKIwXPa5lleef/AwHkwsfdmC319B/1tlEt0ElOnr+BTOheIuczfa
         h118TjOpQC+mXZkGJ5LEmV51sLXTNhxZt9JGg0djFWCW+vTqJjcUgpk7oo/ENbcaE3Y3
         RYWEv8Ub03XlXuZchQGV4UqP2bSpQBgWbkWys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988409; x=1764593209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KcNKygSH663Cq7ccIPy1yee59jsF3OcZatBL8KE+sKc=;
        b=scvlltfPnzav4Fnv90vYW8UDa5JqWafFHTTDQ+JJtCpS0aOjIkqFpz5CoMwABF9rDX
         srVcQAp9z0h0YYjHx8VTkN0zUvbKdl4Kmsq1UtjD5rxwTBOaeHAOilzkBapqfG5EE/ot
         p3I43orEzi5hK9usz7QUPR/9WABagR3N/zwhCX+mp/7efg0kJmR3b5enVrSSlB8MNAHg
         54l9BqaAW/kTPGqoUQQwS0o12QlPkI4P1fcktuo0Sxvfmlu19EGIWMtgFd08j0KPSA4C
         wlt+BFlAiNGH07GGz3YS8bwYT8EapKm2E0FKNgLO46hpgna/STp+4kD3OzBZIdRImi7g
         LEOw==
X-Forwarded-Encrypted: i=1; AJvYcCVdPtrUZt54X61QrJuSSnJRtisPks7VDL50Klv/jpzuDGgyyNwJntSWPBeSYkhj5R53Fbnyj+3LesuwooXQTG4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgOkHY7fsHnQ5Rnnl+R+4Z8yyoSOVAkRe5xml08dj+63US7BEZ
	kZ7FaeVIqroTNrVk4VJTUnm4C1H7NwvxfjI2c1VzyhZihTa8ACopudphrNgXgv6gvg==
X-Gm-Gg: ASbGncs5tG0ZzE+K8WLir/aIqNOHbHJy+IyeuBzBgc56QUYffwMywV8ATea2wt/DFii
	zPVZaFuaEbLwn020NDG11sdAZjjx7O+yKnyXN0MsTr4pXUjKg3BeK36+6Ewy3KLp8fQV0T/NdDI
	/2J3FiQTFF8pyemB+OhUAt9PWOM0+Tm1Cw20KO05Y+VCnktnRXjcqgGw2fvtcuOvoxJeNZK78nt
	X7jg8e+VNr7ULGU4rLis7LIZYHkd0euFIUszT4EPMQqI+Vi8/vwnghkJPyjgg7HPywKRdgb5J+P
	cQRfo5vTCDwPTFoDcY7z5ZJO1GXQOdEdJzhDyab6AkPAnHItZrx3zJecXhuE4PwIp/OJpUrMIsU
	NTkVPZkaOMpI7GF3c6QIFG2tLOKljNAQ9b0FkfgHSb4gXF+abHdDwqjVrPG9dcv1iUhDQt+kJDp
	7p9LgAfUe+imzHuxAlkszhbLveltWbkO1qX85+jxmX315x4SB+VkwYwinSIWYR5aVsXcc3QPhcK
	lExNiUycas=
X-Google-Smtp-Source: AGHT+IE4LIQdRqEDZF6wZq0Q+W5lQArq5CFAWkZqHjvIypeEj3xstLPCx4WOLYpXdzHH0SS1oqU1nA==
X-Received: by 2002:a17:906:fa0c:b0:b76:8077:4eaa with SMTP id a640c23a62f3a-b7680774fecmr698118466b.6.1763988408735;
        Mon, 24 Nov 2025 04:46:48 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536460ea9sm13342599a12.35.2025.11.24.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:46:48 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 2/4] platform/chrome: cros_ec_typec: Set no_mode_control flag
Date: Mon, 24 Nov 2025 12:46:37 +0000
Message-ID: <20251124124639.1101335-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
In-Reply-To: <20251124124639.1101335-1-akuchynski@chromium.org>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb2..c0806c562bb9 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->no_mode_control = !typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.52.0.rc2.455.g230fcf2819-goog

