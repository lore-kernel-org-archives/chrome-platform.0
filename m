Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B55B1FB7
	for <chrome-platform@lists.linux.dev>; Mon, 11 Jul 2022 07:29:29 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id q82so4031127pgq.6
        for <chrome-platform@lists.linux.dev>; Mon, 11 Jul 2022 00:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ARuOjXkb9WXnMbJXcHgDAqXcx2iKK+w+U5wn5FQDR6Y=;
        b=LsrfyOyORhRqy17RRdlUiq4/FL4fmPohUX0HMOTvZcv3yzrGxL/RLEQkQLySym6zT8
         geDq4SkIulIvPi8e0WHHf2dW07ZZMJt8dp24O+BtXaI0YO58AfnC7Zqwzsci2gIJbXZt
         a+aFY/sJvcltJ2Kr5EIRakDkQo/wWXvOeY0H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ARuOjXkb9WXnMbJXcHgDAqXcx2iKK+w+U5wn5FQDR6Y=;
        b=72C4eZfViEYn70j0ZEzS+hMJFrD+bH8UbaGwFq1Rr1/n2dWaxitqMPhmwOJSIkM5+o
         LLcKzaxe4GaELH4Db7IQzbUsO8r8jlPcUp+Qs1AokRKDk4jVaoa0Vc81z83+YqMzByfk
         5O1hhflTX93I81Od/XRbemFP44Mm/jq50kZrZmGAXIDeSSt9mSEydXiv/dk8LSvlVq5g
         ml81z8iOKRwMT21/YXnwYrAuNLeIZxYMIXbksmDpcz7zjdBXokbj9aBZ4n3UyJWHNp4+
         9JAe2SoI6BqIVscHXUOlHUR8NM2z7Mt7tF8z8jbpzYauRDj2CVdvWnONWveWmBw7RFUF
         960g==
X-Gm-Message-State: AJIora/TDyPeIGw555ya5/q021cV/NgY8egeEaSr8EV/2Rrtvmzykpci
	wE3z6kAwY6glaTLgUd5rQdipvQ==
X-Google-Smtp-Source: AGRyM1uXjFYsxXcTBMnm60zGyOA7F3T8MVkEl93WM7/+YkjruocghxWq4EfsD+tnXUN+29P8LY1rYw==
X-Received: by 2002:a05:6a02:11b:b0:40d:dfdc:95d7 with SMTP id bg27-20020a056a02011b00b0040ddfdc95d7mr14907022pgb.536.1657524568710;
        Mon, 11 Jul 2022 00:29:28 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id z8-20020aa79e48000000b0051bc5f4df1csm4012839pfq.154.2022.07.11.00.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 00:29:28 -0700 (PDT)
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v4 8/9] platform/chrome: cros_ec_typec: Cleanup switch handle return paths
Date: Mon, 11 Jul 2022 07:23:02 +0000
Message-Id: <20220711072333.2064341-9-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
In-Reply-To: <20220711072333.2064341-1-pmalani@chromium.org>
References: <20220711072333.2064341-1-pmalani@chromium.org>
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

Changes since v3:
- No changes.

Changes since v2:
- No changes.

Changes since v1:
- No changes.

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
2.37.0.144.g8ac04bfd2-goog

