Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB00637
	for <chrome-platform@lists.linux.dev>; Wed,  4 Jan 2023 06:09:01 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id h192so16744822pgc.7
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 22:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u7z3aK6JYwkPs6rlnGUEdEtPieaIcdnszYZ0OhEZgdE=;
        b=A6I+o74xCrRkH0h+QHiX6jGt3VZxCmIfjp+jxfvdOhYCl6RW/k93Mmi0I0nO7daPzJ
         HG9L0rIiILKq/9Gn8C4SNJwqjFUMeEQRB7ZzwoeiX0QK/BzX6cKjiTZeXz6VVSB+rbg0
         2js3EAqQVR7NoJK0w5e6E9fqqUBt06R0g1pQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7z3aK6JYwkPs6rlnGUEdEtPieaIcdnszYZ0OhEZgdE=;
        b=RYr/CHdeIECiLNCLlSFLnl8e87LXtHxIGpUYfVEZq1HR+r7D9hUEl6i0USY08j4EG/
         fUM+nnL5kWUD/ekwg+lqGdbq/u16aL2dtb2GfpjSZcmx6Ni678wmTVgXyzdNvfcTQu+T
         66WyO4Sf2G5r39vKN8cfRmimNYpcmH7KIu6FfsnBEXCuMphoEVVIlNteuNMsxKmrsxZJ
         5bzRfPCUdaJ9Z0vjr6G2bHZvZPIXzBdidcSR4GU3iO7k2YriwkB854jYVP1DTX6PmVqg
         +D1KykxAGw9sD3X7G6EAyWrniippkZmNqtaKe9D9vIoPcp+x1nVIFH+Zm/Wjk7iQPADe
         P5+g==
X-Gm-Message-State: AFqh2kopMQhNZ3T8gzBRV/hu5UGkbn6Hdp0Tb2LZx1Ols9QPZr17TdGH
	LPlneWDz2GzBIorJFFT8g1XbJg==
X-Google-Smtp-Source: AMrXdXt0PaJnwyroJBMafonPPYnzD/kMJKo9ipb60mRVcLKLwEEk/JuOmREFcOFP4O2lCg9Tli0dkg==
X-Received: by 2002:aa7:870c:0:b0:581:c9cf:3807 with SMTP id b12-20020aa7870c000000b00581c9cf3807mr22602868pfo.29.1672812540812;
        Tue, 03 Jan 2023 22:09:00 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id v27-20020aa799db000000b00577c5915138sm124660pfi.128.2023.01.03.22.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 22:09:00 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH 1/2] platform/chrome: cros_typec_switch: Use fwnode* prop check
Date: Wed,  4 Jan 2023 06:08:44 +0000
Message-Id: <20230104060846.112216-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using device_property_present() multiple times on an ACPI device
leads to kernel panics on Chromebook systems. This happens when there
is > 1 boolean property in an ACPI device which is created dynamically
by the BIOS as part of SSDT[1] on Chromebook systems

Since fwnode_* can handle simple device tree properties equally
well, switch to using the fwnode_property_present() function
version. This will avoid panics and make the usage consistent
when we introduce a check for the 2nd property in a subsequent patch.

[1] https://wiki.osdev.org/SSDT

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_typec_switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index a26219e97c93..2536bda03bf3 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -254,7 +254,7 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
 
 		dev_dbg(dev, "Retimer switch registered for index %llu\n", index);
 
-		if (!device_property_present(fwnode->dev, "mode-switch"))
+		if (!fwnode_property_present(fwnode, "mode-switch"))
 			continue;
 
 		ret = cros_typec_register_mode_switch(port, fwnode);
-- 
2.39.0.314.g84b9a713c41-goog

