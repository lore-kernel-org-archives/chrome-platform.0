Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC592C9C
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 18:48:28 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id qe15so17583pjb.3
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 10:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3nJw75yUn0Ak2LbjP8FDSUKGk9cBjMNSHZr8K3rv/n8=;
        b=Kcc50LqTHuQIYf273mHplhXaUKkVZo5PUBRoSWfRcf58iiGQ2BqdIdG45EwyPs1uXs
         CAAbXNkEd2gr6pK4HN7DiQh4qUIHHNlorxb+wH1BXIOdeK6oQxUKyLl5QTwejhLKNtmR
         CteLOdhUCS5CWbC0mzNmxIdXJAHtmnBxfT90k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3nJw75yUn0Ak2LbjP8FDSUKGk9cBjMNSHZr8K3rv/n8=;
        b=wu8wZCsblrVHWvhCWhINDc7Qnpx0rryjIKRWCWW258YKW6Y1WLwU4glK5+pRgMn89J
         1Sqxnt2VO9miar2/7KC9qpupucZExsNjyQENgn24ZSzVK0cNnCQdRAx/SGN/Y+DqftB9
         kNPLYnmFk5MY9TQ/bZ3B8OdcLOGFUxU7toZIJJ/AqVsk1wbWnvBYFqKcilHdAt20fvUC
         QSIbiBK6NdbhUC8S9ckol0CWsCLhaZXSCSWl0OTdANHrMrXG+RHS4BCaV6rgfsX//KOZ
         xcqU7svqKqetxCSSxRP/MFg+s1bKiy4w3JgxVQcByh6qng2hp7dHqVIvbxqr5Ik8G11H
         rBxg==
X-Gm-Message-State: AOAM532bQ/R5D5tnjmpMbV386ce8DuR1OAGvdemKvNLcY0B41l6bEOQy
	snejeLcKGMb6cxWwdtqMu4eRvw==
X-Google-Smtp-Source: ABdhPJzUwlOAtGq+Y2cBB0fnuRDAYTc8P/abuAm1YmIdSlVd7T3zol+qZiMELS+dYrh3y9do6LWUBA==
X-Received: by 2002:a17:90b:4c91:: with SMTP id my17mr2870441pjb.121.1644346107948;
        Tue, 08 Feb 2022 10:48:27 -0800 (PST)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id gk15sm3594453pjb.3.2022.02.08.10.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 10:48:27 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROMEOS EC USB TYPE-C DRIVER)
Subject: [PATCH v2 4/4] platform/chrome: cros_ec_typec: Update mux flags during partner removal
Date: Tue,  8 Feb 2022 18:47:24 +0000
Message-Id: <20220208184721.1697194-5-pmalani@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208184721.1697194-1-pmalani@chromium.org>
References: <20220208184721.1697194-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cros_typec_remove_partner(), we call
cros_typec_usb_disconnect_state() which sets the switches/muxes to be in
a disconnected state. This also happens in cros_typec_configure_mux().
However, unlike there, here the mux_flags variable hasn't been updated
to reflect that a disconnection has occurred. Update the flag here
accordingly.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes in v2:
- No changes.

 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 3019e29f200d..4bd2752c0823 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -228,6 +228,7 @@ static void cros_typec_remove_partner(struct cros_typec_data *typec,
 	cros_typec_unregister_altmodes(typec, port_num, true);
 
 	cros_typec_usb_disconnect_state(port);
+	port->mux_flags = USB_PD_MUX_NONE;
 
 	typec_unregister_partner(port->partner);
 	port->partner = NULL;
-- 
2.35.0.263.gb82422642f-goog

