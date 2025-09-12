Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1222BE649
	for <chrome-platform@lists.linux.dev>; Fri, 12 Sep 2025 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757659687; cv=none; b=ucsmZpX/dKPBlcPP2+dfyjwKMGMM9lmcXP56HopXPMMhYlkdigLTQz67ki9+V/lgb32dyWiu7XgvBxPj6DJ6tRzAhciMvZWrVe75Sl4mD+ipsiRjEU8j79pHvcUhQee2mOTlpXhUz9+wPKM3qHbh8xDpQt116EZdDDbRdFP9GRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757659687; c=relaxed/simple;
	bh=DUPoh4Zyec6Zt7EqJ5e3ik3Z5aBUkLkTB6W4xkQH9DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHmZtxXS24UPtsKX3G/W7hX6BZ/oTf5Rs5jLXWz3MYczYHmgX1SQNe6vtuzHH+VNe2faQODrwE3rh1NTLsd1EznyY4ydSZS/LRh7cpK62QAi+Fn5xW20aZ8GdTEgQqDP/iZvNpn5bySMmsNN3Gdc6U+joj24BpcSCoUfMDnx48k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EXc8mE24; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EXc8mE24"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b046fc9f359so236542566b.0
        for <chrome-platform@lists.linux.dev>; Thu, 11 Sep 2025 23:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757659684; x=1758264484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NvADMrt6HurTsoe+Lfqu7ifPRq1qi6pH7Zq/9XUUt8=;
        b=EXc8mE24krg8sqLMwSMGG8wdm8eT2yHZZn1gaYkXjbZHJF8zSSZmyA5qAMjToZacVP
         5iSTUtaMx4gceCJSF7lAj6exCDGINXHUVa/L95uGOy/uKuHQksB78AbML7YEIlstpTPT
         nGmfT4B6I/KEHyaHHXMKbYq8V3HTNR2gkgkow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757659684; x=1758264484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NvADMrt6HurTsoe+Lfqu7ifPRq1qi6pH7Zq/9XUUt8=;
        b=qFwgr3HuS/L3w1wV+jHdXPW5vCt8r9BNXZfx7OSa6VsjGK7NyMlujPMZFpLADJDonk
         dm2UrhfqazWD99n2W1IKy3EDLptZubFWwP1g+XLvsetoe8roYdGORcgLsFABmKKwvWDu
         ahnlm42xmzBimwKxUKrsIXYmHNyrmny2Zj5i52SpWYHp6+FKUVWbfgEu8eagEGP6lOJ2
         h4kbe8Btd0q925Ld/DK7rllFmFf4R/zPbqNnbKGnhgOt5L5/wVAflh+iPD2etMtkYC+l
         9B05hnSX+9yk/LpsKlG9OMOUS/rMM2y4pKMC7VfXVRLBu4NP7tg3o6hx+MSvIFI97Xv2
         hfig==
X-Forwarded-Encrypted: i=1; AJvYcCUP0ix/oCjyl+O61TA+5IpqpMWeanWXAHfMt5lbGpCfsC5GHd5pmdkqeY4QkNUoZDqVqSJKum3CMuF2Hr3/vn8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUMv+2r530RjxWDKlHTgT/oB5pZ3+XrMqul2GtvsucQHvmvH6z
	mpGDQNzmvawlQVqq4BP2lSzsZB3D8XtPAEfl3wJeLyYkRzLv3Ym3u9zapNKd2mf15g==
X-Gm-Gg: ASbGnctSRgaSofdevP7zAaMYM6TMwzJLCDuD+ToxlkMrvM2Bh2qK8Vc22N0Xa4Hkrl5
	Z3Hrq1jWnFmPJpys8ZNE5IV8gA15FDfzSqlrzCQY7h1tW8TCHfv/0aIkUFCnMIqXJMoHkJxovOE
	czQDk6A1g96+SEiAXG3Q+EzP5QexhilC3WsURpiY1J24kcyTNmb/Io5ueC9klJLicr1Ap+5zhqa
	aOhUo74ZCuCMFBMAqNAZPdQ8DD9krOWQ6Vvlj7ueC00ec2aCc4rixQ9nLRIXnshOXyfviqb7PBu
	sIDreXWf9iytRHOs02/wfOCEX13F4OzMb9ADnLcAdlgfGPTm6rB6gVgp38g5Ufar0dimcQp9qPq
	ecLkScUYiGMIImuQmEMqICBabIflTa24EcoiHrxDQRbrQOfwUSsJsAh27auCjcYhOlwYn+1ronZ
	qwKfvmnQPHiSRecoy2pES7+O8RTGSGMNNUWXNa
X-Google-Smtp-Source: AGHT+IHO5xX13tdxcN9DsT2lG0RauabvfBllR6+E3bjJfEFfjTIbdd3fJBDvYLD+ZC7qjjUCzN9HRQ==
X-Received: by 2002:a17:907:7e9a:b0:afe:ea93:ddbb with SMTP id a640c23a62f3a-b07c38673ccmr167104066b.45.1757659684076;
        Thu, 11 Sep 2025 23:48:04 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128a1esm295465366b.29.2025.09.11.23.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 23:48:03 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 3/4] usb: typec: Implement alternate mode priority handling
Date: Fri, 12 Sep 2025 06:47:50 +0000
Message-ID: <20250912064751.1987850-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250912064751.1987850-1-akuchynski@chromium.org>
References: <20250912064751.1987850-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces APIs to manage the priority of USB Type-C alternate
modes. These APIs allow for setting and retrieving a priority number for
each mode. If a new priority value conflicts with an existing mode's
priority, the priorities of the conflicting mode and all subsequent modes
are automatically incremented to ensure uniqueness.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/Makefile         |  2 +-
 drivers/usb/typec/mode_selection.c | 62 ++++++++++++++++++++++++++++++
 drivers/usb/typec/mode_selection.h |  5 +++
 include/linux/usb/typec_altmode.h  |  1 +
 4 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 7a368fea61bc..8a6a1c663eb6 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TYPEC)		+= typec.o
-typec-y				:= class.o mux.o bus.o pd.o retimer.o
+typec-y				:= class.o mux.o bus.o pd.o retimer.o mode_selection.o
 typec-$(CONFIG_ACPI)		+= port-mapper.o
 obj-$(CONFIG_TYPEC)		+= altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mode_selection.c
new file mode 100644
index 000000000000..048e3f75efa5
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Google LLC.
+ */
+
+#include "mode_selection.h"
+#include "class.h"
+#include "bus.h"
+
+static int increment_duplicated_priority(struct device *dev, void *data)
+{
+	if (is_typec_altmode(dev)) {
+		struct typec_altmode **alt_target = (struct typec_altmode **)data;
+		struct typec_altmode *alt = to_typec_altmode(dev);
+
+		if (alt != *alt_target && alt->priority == (*alt_target)->priority) {
+			alt->priority++;
+			*alt_target = alt;
+			return 1;
+		}
+	}
+	return 0;
+}
+
+static int find_duplicated_priority(struct device *dev, void *data)
+{
+	if (is_typec_altmode(dev)) {
+		struct typec_altmode **alt_target = (struct typec_altmode **)data;
+		struct typec_altmode *alt = to_typec_altmode(dev);
+
+		if (alt != *alt_target && alt->priority == (*alt_target)->priority)
+			return 1;
+	}
+	return 0;
+}
+
+int typec_mode_set_priority(struct typec_altmode *alt, const u8 priority)
+{
+	struct typec_port *port = to_typec_port(alt->dev.parent);
+	const u8 old_priority = alt->priority;
+	int res = 1;
+
+	alt->priority = priority;
+	while (res) {
+		res = device_for_each_child(&port->dev, &alt, find_duplicated_priority);
+		if (res) {
+			alt->priority++;
+			if (alt->priority == 0) {
+				alt->priority = old_priority;
+				return -EOVERFLOW;
+			}
+		}
+	}
+
+	res = 1;
+	alt->priority = priority;
+	while (res)
+		res = device_for_each_child(&port->dev, &alt,
+				increment_duplicated_priority);
+
+	return 0;
+}
diff --git a/drivers/usb/typec/mode_selection.h b/drivers/usb/typec/mode_selection.h
new file mode 100644
index 000000000000..7f027d591cdc
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/usb/typec_altmode.h>
+
+int typec_mode_set_priority(struct typec_altmode *alt, const u8 priority);
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index b3c0866ea70f..fdac5e227df5 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -28,6 +28,7 @@ struct typec_altmode {
 	int				mode;
 	u32				vdo;
 	unsigned int			active:1;
+	u8				priority;
 
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
-- 
2.51.0.384.g4c02a37b29-goog

