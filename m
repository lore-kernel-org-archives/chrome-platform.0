Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E105E3002B2
	for <chrome-platform@lists.linux.dev>; Mon, 25 Aug 2025 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133895; cv=none; b=L7VLHvqucvix4fA8/hryX80U+v4libQ1rtFOND3fQ4N59X4y/guyniTfueZWCYw8j8mZSKQVEABDZJaPyttZfOSTdJgFRFGiPZkU7J4aY6jYXTM8UQN5WraVNomKT7dUKmbuvM256LJiXK12NFiEe7So7wLrGbZx/FLgAzM1fUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133895; c=relaxed/simple;
	bh=0BGpDIvSRWnL+9XoMN9WOJgDbPiOu14Iony9ATZBpSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DN8LjdZ5+8C53Es7cuBMv1/eF0Oqfak/SQnBIn/hiNzLfvAMd6gtjmPaUrauN2VkRKCLhLvLMZPjXY4kPO1fkKx4KrkrIrdxybpoAe+p7i++So+ht0qOlyUREtV+2BLfkxpOFyk3onuwN/G2kppB/eXRHvC5QLEVcAkllAf2xDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fN0TTp5M; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fN0TTp5M"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb78da8a7so705856066b.1
        for <chrome-platform@lists.linux.dev>; Mon, 25 Aug 2025 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133892; x=1756738692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtPmPO5XNYkE7V8xoQ7flpHn7rik8pyLeIH7/5dO6qM=;
        b=fN0TTp5MuQcCCSNlPTupkgqkVehVoA8e36bh2rqcx8FczxY70w791I7zDDNWT60HiM
         2ifGMM7drtd4kNZDeVJfSTQo1HBknQxam2UVgajt2FA810QvuEmRVIpSQlOOOm2FqCY6
         F1vHpuKGkI29ZspoxZvYUS3btCuXiy5M20d0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133892; x=1756738692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtPmPO5XNYkE7V8xoQ7flpHn7rik8pyLeIH7/5dO6qM=;
        b=V3abA52EBEJMNy2DoQ6ck7gTGFIOybFNkSWJN8jNNurPaCnnvkIbMoQgbwQ5lUR2z4
         cfMniBSVqfxbJIG2EioRsYXfsXLjDQM+27/4Q0yXL34xwalER9hnILPi+Uee+mU6IiyN
         x3WjJ+n4XbdcqJwIDjtJj3CB+WqQbEjjm6PPoYGOZ4n2SPKZ88DbQxGluC8TpjUpX0tI
         yRRJIowlxIhk9AwmcF6p8NKzWcX6hicrB1ucdWBgwA0qpcW3p/NXmzU4ehLQ4Fj4COXr
         EvPiASsu1Hkp2sFoPo4J9HuVC9fafwTF6bAD/01SjSRTsabr4ZBXpOxKQvwmKKcNaamO
         n0yA==
X-Forwarded-Encrypted: i=1; AJvYcCX8lxEx25ddVsA2t45tymLhevw4ef5pr5tQXKO4nrQM2r6FPdrnqUKXNWyml+MX1vzpryIHHeGaS70G3MNvhmk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4pU/RtTSbP6dd33TjAo9ovRrhRwLwwouhC8Q7ZSgEM5A8lyVr
	++pEnhgVVehvS4eJuyoZtm2X2Tu6Sn875bBYB2qDCAv4NbE3dZxmDdVuCS+GoPAa0A==
X-Gm-Gg: ASbGnctd3cB4Hk8TQOCecMdTrpVsqyWgkKZJtShlUnzn6mwA3qJ9BMkYIQaCYh9bire
	wnTB/3oN76dwh1z1+y4C6vyBjvk5WoolCzZYjWeUOJkpkrxsKoYVoZwKY4Eg0oUesOrD72gEWDJ
	gUB8nF5/ehmTjKkxG8MYtARBpifeeXtRyMX/0/HNaqbsZjPlGiDrOGpauOzum4Tmj7Ejvx1I3RM
	nc46rBPdVOtkKmggv/kM56N/UvaHaj3UvOEfk5U6O3ak7BWM/7OM4gi2zLXQhXTJZNSVh8DtLNa
	t1KyjEZVWfiV61roPORky/6/vMxaqIEdgOcWarnFFRnJ9/VDrQ6LaTkEi6EBzBEW7DWdHwwkKEQ
	j7Ib8ru+oZ2kDW9RMN1JMSPa+PzEuj0n5SpcpjJp8xqsccTFIsFW8iw9A6Cao6BZZaFQ5x8uUhD
	o2OaozkmEBcAAI
X-Google-Smtp-Source: AGHT+IFHIKJNDrGoroZVVpWmctlQ9FpQ8lFadPfFf19Uh7Mtgvrs7j6pKi3bP2ml+nSy2qOMBnyr+A==
X-Received: by 2002:a17:907:6e92:b0:af9:5b3f:2dfc with SMTP id a640c23a62f3a-afe2965ac9fmr1000432766b.47.1756133892254;
        Mon, 25 Aug 2025 07:58:12 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (168.23.91.34.bc.googleusercontent.com. [34.91.23.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8d03f981sm117294166b.60.2025.08.25.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:58:11 -0700 (PDT)
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
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 4/5] usb: typec: Implement alternate mode priority handling
Date: Mon, 25 Aug 2025 14:57:49 +0000
Message-ID: <20250825145750.58820-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
In-Reply-To: <20250825145750.58820-1-akuchynski@chromium.org>
References: <20250825145750.58820-1-akuchynski@chromium.org>
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
 drivers/usb/typec/mode_selection.c | 38 ++++++++++++++++++++++++++++++
 drivers/usb/typec/mode_selection.h |  6 +++++
 include/linux/usb/typec_altmode.h  |  1 +
 4 files changed, 46 insertions(+), 1 deletion(-)
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
index 000000000000..2179bf25f5d4
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.c
@@ -0,0 +1,38 @@
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
+	struct typec_altmode **alt_target = (struct typec_altmode **)data;
+
+	if (is_typec_altmode(dev)) {
+		struct typec_altmode *alt = to_typec_altmode(dev);
+
+		if (alt != *alt_target && alt->priority == (*alt_target)->priority) {
+			alt->priority++;
+			*alt_target = alt;
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+void typec_mode_set_priority(struct typec_altmode *alt,
+		const unsigned int priority)
+{
+	struct typec_port *port = to_typec_port(alt->dev.parent);
+	int res = 1;
+
+	alt->priority = priority;
+
+	while (res)
+		res = device_for_each_child(&port->dev, &alt,
+				increment_duplicated_priority);
+}
diff --git a/drivers/usb/typec/mode_selection.h b/drivers/usb/typec/mode_selection.h
new file mode 100644
index 000000000000..cbf5a37e6404
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/usb/typec_altmode.h>
+
+void typec_mode_set_priority(struct typec_altmode *alt,
+		const unsigned int priority);
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index b3c0866ea70f..571c6e00b54f 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -28,6 +28,7 @@ struct typec_altmode {
 	int				mode;
 	u32				vdo;
 	unsigned int			active:1;
+	unsigned int			priority;
 
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
-- 
2.51.0.rc2.233.g662b1ed5c5-goog

