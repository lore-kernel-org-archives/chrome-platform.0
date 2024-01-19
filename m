Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76334D51C
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705650518; cv=none; b=aeSFEK97lkABc4UFefRFSmUTcNNeJqiBu8qDnZzktNOclgC43uHV6/q+8957j7awVxzrzvcwYjk1TNl5Ts02GKBwbzzVChpXOBYjijydbic1+SQxWL7CfoDEyF+FymoYhavcHt4ssHb/Vnb6KvFk7MSQr2dpg8WzYRz79j0Yf5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705650518; c=relaxed/simple;
	bh=ebbJ6bA1dlgy/6ZtQSvyFQkwF2mZTYLPxjDz3eZfPdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fZzAkHlipmmMqq9XGcaaDK8LoaQLdT+jyX7nHMPi4gcfesu8zGJu9FbMCLZqQX2SuBi8TGg5oK/0BEAoQkSp9KdOQje20JAQmWA7/DZWeuaWLs2jPhB26TRtElk0wf2VZpDeEkqvYWkZCdTpBfYwn7BKwDX6RfxKSev9pDiqarY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l2LJyWTE; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l2LJyWTE"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5cf22a89a54so303819a12.3
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 23:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705650517; x=1706255317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXGjBm0+HOq1i2RiP/xgovqiQd2Jx9NrE+bGhtMDLmQ=;
        b=l2LJyWTEZfxr5/E0PZKuFPf57p6lNqqJJFgVlRYnjhBCG8S9JSaqJKIBq8Igxeul8n
         HDgZnBBUYq5atoImBCzEP+F9eud8xL59pbvZfRn0kgOIcpBdJCl6Ikqdv7OfKp5Lf2gB
         ULuSZcjBIGQ1Im6SKPKjZ57iTl3oJqqsdX2lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705650517; x=1706255317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXGjBm0+HOq1i2RiP/xgovqiQd2Jx9NrE+bGhtMDLmQ=;
        b=m1rXjFV/KLPSoV0P/dfm24/hZpacCyPNQnEB77ZcQS8AOuPmeLL87s+NtivrtqyMzD
         W8QtninWMJkqeHbUl7GbGzh+3NwNx83Qz/I8g0GlhShy/OlVoVXQgzZ4g1QzBTzBYx3x
         iJlpcv+Kf6uK8ClSco5Rjb6cMM0kbQDi7XKo3Hb4XYzcT5Tmwh9CDV16oAIqgK3/oWL6
         pTXo+hVqFl0CNr5t6kf2QWt6VNxbLAjNgdOmnBrrLVBqt+niXiSqI5m1X+M+s3iWNmv9
         w0WIyoocDXgEhz4HCMhSWcAM0aNbh1AcW5Zu24B59yzfQ283CbDIv7mVGVH6IV/lxXe4
         P16g==
X-Gm-Message-State: AOJu0YypOh/6QeayReCY7i/8nt8zBFhob5o9eCgEamDkYIts5GiiFPBX
	5FB4rzOXnoZrclrG7fqRcw3KczD2JQ1o60ZZycG1wiSGj/xyxSpmIIhN+x3s9w==
X-Google-Smtp-Source: AGHT+IHQna9e3X42lqrWFOSQZQYMAmVaV6Zoi5bSDcbYwGwoWzErrSZ7syFdmAt05s4X8B7fmLNpGw==
X-Received: by 2002:a05:6a20:9154:b0:19a:e212:46c with SMTP id x20-20020a056a20915400b0019ae212046cmr1736163pzc.95.1705650516771;
        Thu, 18 Jan 2024 23:48:36 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a5a9:5dbc:778d:db07])
        by smtp.gmail.com with UTF8SMTPSA id j14-20020a170902da8e00b001d4b1d190e3sm2435533plx.58.2024.01.18.23.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 23:48:36 -0800 (PST)
From: Ting Shen <phoenixshen@chromium.org>
X-Google-Original-From: Ting Shen <phoenixshen@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: fshao@chromium.org,
	Ting Shen <phoenixshen@google.com>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	chrome-platform@lists.linux.dev,
	=?UTF-8?q?joewu=20=28=E5=90=B3=E4=BB=B2=E6=8C=AF=29?= <joewu@msi.com>,
	linux-input@vger.kernel.org
Subject: [PATCH v2] Input: cros_ec_keyb: add support for base attached event
Date: Fri, 19 Jan 2024 15:48:17 +0800
Message-ID: <20240119074831.2979671-1-phoenixshen@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a new type of ChromeOS detachable keyboard that talks to
the host via CrOS EC host command interface, rather than the USB
interface.

To trigger the firmware update daemon (hammerd) on this keyboard, a
signal is required to replace the typical USB hotplug event. This patch
addresses this by mapping the EC's BASE_ATTACHED event to SW_DOCK.

Signed-off-by: Ting Shen <phoenixshen@google.com>
---

Changes in v2:
- update commit message

 drivers/input/keyboard/cros_ec_keyb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 30678a34cf647..d2e0d89d4ffdf 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -128,6 +128,11 @@ static const struct cros_ec_bs_map cros_ec_keyb_bs[] = {
 		.code		= SW_TABLET_MODE,
 		.bit		= EC_MKBP_TABLET_MODE,
 	},
+	{
+		.ev_type	= EV_SW,
+		.code		= SW_DOCK,
+		.bit		= EC_MKBP_BASE_ATTACHED,
+	},
 };
 
 /*
-- 
2.43.0.429.g432eaa2c6b-goog

