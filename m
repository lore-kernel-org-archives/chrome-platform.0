Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EC53FC7
	for <chrome-platform@lists.linux.dev>; Wed, 26 Jan 2022 20:14:33 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id b22so621814qkk.12
        for <chrome-platform@lists.linux.dev>; Wed, 26 Jan 2022 12:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=TXHz8jk0g9B9htTjM9hon5fRMTOUq2KGvicPZg26VEg=;
        b=Z0G9yFN+dWbTP7N3D6XMqteOr9ykzqKMZ5rS7jPPyI4S8Ov96HjGd1pImFHQ++ZKzE
         yp7jOpovUUA144we3VZV3PYB5+/UyPzXySjGKIUhdoBrbMM3w1dy6rHfEMe+7W63vsJp
         X13wzdk4mlS5MiRdSS6gFHgUC7bdYMUZPDqjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=TXHz8jk0g9B9htTjM9hon5fRMTOUq2KGvicPZg26VEg=;
        b=wO21ul0HznkuaArWUj/1U6vcrqlkNhj+VCkRcoLDuF8IKqdR53Fl/+iZOYalxGsAbx
         ikAD7O9bBBEYQOQ619RW2HsVyy3EX9KYDSH3wjgYvNiDSGoqOFINC7w/jnIZ1/gDwjgR
         ITi18hiuCw1uqExo9xlxjgXMEqGw2uh+Ec4biKRjPZXLe1OwVM0D3pXiN9n+MQKFTUbe
         MMaAmAQtSVmzZQEURhoOw/LpG2lsCbvhSfG8fTBUzKaV0yYKg/pzwVIhKX8E8HgBMEcT
         Sl5Ynou7wR/vtM0Mje8RwTX3sIgAOyfOJffBnqZI0Xe+vP5T9fc0GnPtKsQJQpKiaQnm
         3gNQ==
X-Gm-Message-State: AOAM530sJ0KCuxbBTpFBXQoKg5T3Y+9pnJYPTaZ4KMuYYghAcMGZM/7Y
	WGnI0hzJIVJBxJryCbs5gpDZD28a+jiWAA==
X-Google-Smtp-Source: ABdhPJza6CXsE7PWEgD2rWNpfcJ5/QzcJIYJMCWicY8SYzdahCKkYGlB1UpVbUmwKFUAnFXOZIRsPA==
X-Received: by 2002:a05:620a:c45:: with SMTP id u5mr306313qki.563.1643228072408;
        Wed, 26 Jan 2022 12:14:32 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id 187sm151280qkm.63.2022.01.26.12.14.31
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 12:14:31 -0800 (PST)
Date: Wed, 26 Jan 2022 15:14:30 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: chrome-platform@lists.linux.dev
Subject: Test delivery and start the archive
Message-ID: <20220126201430.4mcvrxe5camd4s4m@meerkat.local>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

Initial message to test delivery and start the list archive.

-K
