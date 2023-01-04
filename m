Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D4E637
	for <chrome-platform@lists.linux.dev>; Wed,  4 Jan 2023 06:09:03 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id 18so9941262pfx.7
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 22:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugbM9GhIHqb4MVhnuzFZlbylgderdj1/9nzv3BJLAfw=;
        b=XN7UcaT/R6KMixGU1AD3M9jb1Wnx1YjmLA6GSFhzDoKqrQ8IupYAFh37F9qL6LDrIO
         nNdnBX+ndVgeatZ1K0YRNlFN6b+/VkggE7paFRmF/E8CTVJl1Yqob9cGfI/+K8vhGjkF
         onos9srhmZfOYjwy/OPJyHLxYB5ZRpdSwTGBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugbM9GhIHqb4MVhnuzFZlbylgderdj1/9nzv3BJLAfw=;
        b=0wAuNdtnHM7Daxhcg+t956BnBGfQMZNCcxTUX1fl1dXE+7Qg6wpO1kjc223YMy39/C
         CfN2B2hwQQypXwMu3bu5o/uRVBSQzIYpOYktJ4OIuIxh9x+nLXZgQWNA10Cmr1YYxm3Z
         Ns19rsbAYEqm0hib/ilvOgaKlwSXDkJNLrdh4kOEfHJuDbExpRWD+V010Yv5aHxycobB
         NMMxM4WQr8D3zRaQSilVEfACjCCfHpw8v4aJ+2Dgl5oqV8XIaded4lb2GxJY4eeHDo4H
         subFxijBdgnhzeDI24FhY5rMEOH65N/SteBfTCArp+Z6oM8ojRBz4VSrf/e5+CBq2C29
         lIAA==
X-Gm-Message-State: AFqh2kq9JODIF7lyiAHBNAii1JHmxMJwBE/v8wb0+X5I3oeJ4+ZQFX33
	9fv5MSpTWxfql8HgpIYug0K/xUmXLOb8yAU7
X-Google-Smtp-Source: AMrXdXtggieJeeDwqXLkoF+peCXfavToOZMjMTl9uWWSTSP3J9bSXdHxt52TTKfZ8IcoA8KPzARU9g==
X-Received: by 2002:aa7:88c3:0:b0:580:963d:8064 with SMTP id k3-20020aa788c3000000b00580963d8064mr59521363pff.20.1672812543417;
        Tue, 03 Jan 2023 22:09:03 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id v27-20020aa799db000000b00577c5915138sm124660pfi.128.2023.01.03.22.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 22:09:03 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH 2/2] platform/chrome: cros_typec_switch: Check for retimer flag
Date: Wed,  4 Jan 2023 06:08:45 +0000
Message-Id: <20230104060846.112216-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230104060846.112216-1-pmalani@chromium.org>
References: <20230104060846.112216-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not all ports have retimers. Only register a retimer switch if the
"retimer-switch" property is present for that port's mux
device.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_typec_switch.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index 2536bda03bf3..9ed1605f4071 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -246,14 +246,16 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
 		port->port_num = index;
 		sdata->ports[index] = port;
 
-		ret = cros_typec_register_retimer(port, fwnode);
-		if (ret) {
-			dev_err(dev, "Retimer switch register failed\n");
-			goto err_switch;
+		if (fwnode_property_present(fwnode, "retimer-switch")) {
+			ret = cros_typec_register_retimer(port, fwnode);
+			if (ret) {
+				dev_err(dev, "Retimer switch register failed\n");
+				goto err_switch;
+			}
+
+			dev_dbg(dev, "Retimer switch registered for index %llu\n", index);
 		}
 
-		dev_dbg(dev, "Retimer switch registered for index %llu\n", index);
-
 		if (!fwnode_property_present(fwnode, "mode-switch"))
 			continue;
 
-- 
2.39.0.314.g84b9a713c41-goog

