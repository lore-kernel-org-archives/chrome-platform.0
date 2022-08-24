Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B6F7B
	for <chrome-platform@lists.linux.dev>; Wed, 24 Aug 2022 04:41:05 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id x19so14642998plc.5
        for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 21:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Jt/G83ni7I/FU67eFbWq1WL9BdjfSCuvjzHq4MUmPEs=;
        b=q1XIf8ztW5mT9Sh2FdsF9dkp7at9wmuUtHs7Av1YAgmiTtmG6WZUs0+SUrfEYPDpQo
         6oe6YnWx7Sk6v2rJg79rpBc2hQ9108SMJMziJ7P6rzmg4MrA9I220VYwz+6YrC3GSVsE
         f1MZnUr6IiM22JgngydNpGMo7q6vWG0ZQNT29sEOKTnZqrMEMfRATKwK9dQWf4wwKkrg
         rOZ4cbprq7pmkkCghzJu5CB+Bwzt9z+H6lpGFJXov6GbtI3cUGwDWcus9hYkmVVX9prB
         XKtVmeL3guur/Xp+a+XpxgZaGFV4Ykx1D/a37yZqeBprGDQCiK26FGmLlurP9ep6WqDS
         D8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Jt/G83ni7I/FU67eFbWq1WL9BdjfSCuvjzHq4MUmPEs=;
        b=ll6dlOt+qzuyRl0yoRe6grAngk06AQff+aoLA3hjzIqVd1JH9VdwIrjQZY4OnKP3mj
         1MD8esG4Lgwgurfh7vK5H01OawcdYr3CRfMSILAAAzGeZd6uD/H7EMi1HZS+xcdYqKuc
         1m/oRarixt7QACi3+nMukKlI/LHCPB0hmrBoKIWyxywK0nPHHhR8ZXymmTA+DtMeAOyZ
         72yBpz9u85jAIJUF5CZp727vPALNhKcZvwH1ALsrzgB2/1uIxap9IMu2QWoeHnwODwc2
         BXWw4KO607ANlKjJx0H+PqcFkBfJgsuR/59zQ6Bp89TH//PeSAe1xS+lIbfpjaan8x3D
         rxTA==
X-Gm-Message-State: ACgBeo3CzphTFs7LtM5AqvB2AyErsu4nbvmUVVxkDxEapatRODzTwRPI
	2o34ZwFCOr7A5hVHaM79WEA=
X-Google-Smtp-Source: AA6agR4y83+GFBiVnDjmvYo0cbNHn+OGbaSKsWoLdo6c8JA1AqWsywufMRb7rrB6FtrkxBmKBkYVfQ==
X-Received: by 2002:a17:902:c94a:b0:16f:81c1:255a with SMTP id i10-20020a170902c94a00b0016f81c1255amr26475771pla.35.1661316064937;
        Tue, 23 Aug 2022 21:41:04 -0700 (PDT)
Received: from localhost.localdomain ([218.150.75.42])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902ebc700b00172b27404a2sm7551512plg.120.2022.08.23.21.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 21:41:04 -0700 (PDT)
From: Juhyung Park <qkrwngud825@gmail.com>
To: linux-pm@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	chrome-platform@lists.linux.dev,
	len.brown@intel.com,
	kaleshsingh@google.com,
	Juhyung Park <qkrwngud825@gmail.com>
Subject: [PATCH] PM: suspend: select SUSPEND_SKIP_SYNC too if PM_USERSPACE_AUTOSLEEP is selected
Date: Wed, 24 Aug 2022 13:40:13 +0900
Message-Id: <20220824044013.29354-1-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2fd77fff4b44 ("PM / suspend: make sync() on suspend-to-RAM build-time
optional") added an option to skip sync() on suspend entry to avoid heavy
overhead on platforms with frequent suspends.

Years later, commit 261e224d6a5c ("pm/sleep: Add PM_USERSPACE_AUTOSLEEP
Kconfig") added a dedicated config for indicating that the kernel is subject to
frequent suspends.

While SUSPEND_SKIP_SYNC is also available as a knob that the userspace can
configure, it makes sense to enable this by default if PM_USERSPACE_AUTOSLEEP
is selected already.

Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
---
 kernel/power/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
index 60a1d3051cc7..5725df6c573b 100644
--- a/kernel/power/Kconfig
+++ b/kernel/power/Kconfig
@@ -23,6 +23,7 @@ config SUSPEND_SKIP_SYNC
 	bool "Skip kernel's sys_sync() on suspend to RAM/standby"
 	depends on SUSPEND
 	depends on EXPERT
+	default PM_USERSPACE_AUTOSLEEP
 	help
 	  Skip the kernel sys_sync() before freezing user processes.
 	  Some systems prefer not to pay this cost on every invocation
-- 
2.37.2

