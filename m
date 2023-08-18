Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE7663DF
	for <chrome-platform@lists.linux.dev>; Fri, 18 Aug 2023 02:59:10 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bdb7b0c8afso3528285ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 17 Aug 2023 19:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lcfc-corp-partner-google-com.20221208.gappssmtp.com; s=20221208; t=1692327550; x=1692932350;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s8FIv/P5NEOWnZZHJHr7vxcf/Z4Pvhy6SYUyZNMnQpA=;
        b=np8c+6P8A2igANUhXRe9dt4JXTBssimZIv9HT1sECP80iXMqBr0bvlGqn3HhbOwpTb
         JBqCI2NmPKYz5DF+ux+6Le7hJlaPBMniGGB5mJfVe7v0GzEwik8nUb+tt9KQi8tnYy3r
         1cvjR0YxGo57StPB8D4j++IWfxVIQiw70j8JAlt42Fe2QNWLIqxGNSfNy+BIrN+3X27h
         JLpWx6lmbJAX6MMWrLDa9+zy+OkvoJkBep+ao95t3/0lkW6StHGUphfgmsG9nVj4WGLb
         anOpPMOHhBKM/VDOsNRk0XVlUG7ofCO6DH7WGnfYrHlXlOExSn8pZpfKoJb1OvBZo5Vz
         uQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692327550; x=1692932350;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s8FIv/P5NEOWnZZHJHr7vxcf/Z4Pvhy6SYUyZNMnQpA=;
        b=DoKRlq4bpDrOJVN4z9ERceGMLG40fnfDs05TmFdoa5QD8fAVTeBDKz7GnUAZ/ymZgW
         vjN0KyqfnDnGgxWGOFkqJGUpayzlWaWQygLiQrkhdWdmQkJ9PtmWhw+PiV6OfufcPFsg
         pb6fIL3CfKDZYRKAwgv9ZYnDo07AzbqGlHtUmKX1uw1+kxWAa5ji4pxVGsJ6ButaY2dZ
         og8hJZUa9KjvWYC/WbORZ5Ejh1rX5XscHO9WmTyehCdCn8mef09PvyN3L1endtBGXhWn
         X0wLUBnR3zAMmiN4kOaZ2KtMBR0RsuEHlH7YH5nvhoUGldnE8LM/gqxgvXP4BnjHHJCH
         DBtQ==
X-Gm-Message-State: AOJu0YwuwdN3E216mMzhb/grHdYLQyOKdwoykBuuPh8y/ELLIdCzl0GF
	D/lEhLBmx1TUvthxuKXIeC6IRg==
X-Google-Smtp-Source: AGHT+IEzrPpGM2b8EIV+iUlY+GtpLWxa2TTjWo4hsAE6UI5o5V+TlhzS4Ic1mKWz8vRt5/tspEXM5g==
X-Received: by 2002:a17:902:bc49:b0:1bd:d14a:7e14 with SMTP id t9-20020a170902bc4900b001bdd14a7e14mr1244165plz.65.1692327549961;
        Thu, 17 Aug 2023 19:59:09 -0700 (PDT)
Received: from rasheed-i7-P52.LCFutureCenter.com (211-23-25-187.hinet-ip.hinet.net. [211.23.25.187])
        by smtp.gmail.com with ESMTPSA id l15-20020a170902f68f00b001bdc7d88ee3sm497514plg.37.2023.08.17.19.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 19:59:09 -0700 (PDT)
From: "rasheed.hsueh" <rasheed.hsueh@lcfc.corp-partner.google.com>
To: hverkuil-cisco@xs4all.nl,
	mchehab@kernel.org,
	bleung@chromium.org
Cc: groeck@chromium.org,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	derekhuang@google.com,
	rekanorman@chromium.org,
	Rasheed.Hsueh@lcfuturecenter.com,
	rasheed.yh@gmail.com,
	"rasheed.hsueh" <rasheed.hsueh@lcfc.corp-partner.google.com>
Subject: [PATCH v1 1/1] media: platform: cros-ec: Add Boxy to the match table
Date: Fri, 18 Aug 2023 10:58:48 +0800
Message-Id: <20230818025848.9531-2-rasheed.hsueh@lcfc.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230818025848.9531-1-rasheed.hsueh@lcfc.corp-partner.google.com>
References: <20230818025848.9531-1-rasheed.hsueh@lcfc.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"

The Google Boxy device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: rasheed.hsueh <rasheed.hsueh@lcfc.corp-partner.google.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index c17faf002877..0b7fe074bc15 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -231,6 +231,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Gladios", "0000:00:02.0", "Port B" },
 	/* Google Lisbon */
 	{ "Google", "Lisbon", "0000:00:02.0", "Port B" },
+	/* Google Boxy */
+	{ "Google", "Boxy", "0000:00:02.0", "Port D" },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.17.1

