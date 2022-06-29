Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6C16D17
	for <chrome-platform@lists.linux.dev>; Wed, 29 Jun 2022 23:40:11 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id w1-20020a17090a6b8100b001ef26ab992bso1053786pjj.0
        for <chrome-platform@lists.linux.dev>; Wed, 29 Jun 2022 16:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QRbeot/MuGcqM6NZGZgB9B0h/YlW+GCV/NmCj8D78sc=;
        b=DdlpdV5bCDZGoOcRiumEE3M8qO1XA4NR58Hn0k2DAMnCsFQdg1G5MUhFt8XnNZ1xsx
         IRSTVkMLmB70VB8r5y5sTOiOGihytY/lbwsWejaUtr5+A1GQFaSD3dNfMoU3HQAyWESe
         SolplSffVxkCIZup4rLOnMVbrDbihKQZ9ThTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QRbeot/MuGcqM6NZGZgB9B0h/YlW+GCV/NmCj8D78sc=;
        b=Gbpw2iDJcPoyff3hyr9OC6jYvSh/JFd1HOELCfz0rLkEQZRh5eeh5Di1yoclPkeV+w
         v6WMWPJqXyERWqvrRnavvvuTyQgl5iKU9BMKpkYBpblQ0UVPgrvt2zZpeEOwF4OxSvKx
         YJK42MHzXsLs52NG2A6j6xZ9lfvr7rA3pvd/yPy9LlPcdbfMsBWVBUOCRbFrGN2Tkoh+
         SzZsUmP1kJHoAlew4jwGD/jGjRXBCsvXtpWRDYBsu9WWkmaVEB2XiGZ5PqOdr8ACKYUh
         AWua81ZulKS0vr9mg7kEUEwAOJQ5qMV+K9eQR1WnTyUXNYafWC6mC3+r3IUBQqCfQtnc
         9GQw==
X-Gm-Message-State: AJIora+bKELvK19ywBwdE5T9xMtVnKNpa/v9u0orlE0d0TtF4/zqsDSY
	cIxbFAxFe8xXJj6KXZX+7rHHvw==
X-Google-Smtp-Source: AGRyM1sRWxPwy3uGWZPwxBdeXGbZYOch5+sAQm6m3ULiSuqR1NRow9vm5zjBjP3lHcRZcr0OyWqSXA==
X-Received: by 2002:a17:90a:8413:b0:1ea:ebf4:7079 with SMTP id j19-20020a17090a841300b001eaebf47079mr6862922pjn.48.1656546010854;
        Wed, 29 Jun 2022 16:40:10 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id rm1-20020a17090b3ec100b001ed27d132c1sm127305pjb.2.2022.06.29.16.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 16:40:09 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	heikki.krogerus@linux.intel.com,
	Prashant Malani <pmalani@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH 8/9] platform/chrome: cros_ec_typec: Cleanup switch handle return paths
Date: Wed, 29 Jun 2022 23:32:26 +0000
Message-Id: <20220629233314.3540377-9-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220629233314.3540377-1-pmalani@chromium.org>
References: <20220629233314.3540377-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the return paths for the cros_typec_get_switch_handles()
aren't necessary. Clean up the return paths to only undo the handle
get's which succeeded.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7cb2e35c4ded..39e6fd4491a9 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -157,12 +157,10 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
 	return 0;
 
 role_sw_err:
-	usb_role_switch_put(port->role_sw);
-ori_sw_err:
 	typec_switch_put(port->ori_sw);
-mux_err:
+ori_sw_err:
 	typec_mux_put(port->mux);
-
+mux_err:
 	return -ENODEV;
 }
 
-- 
2.37.0.rc0.161.g10f37bed90-goog

