Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278507B
	for <chrome-platform@lists.linux.dev>; Fri, 30 Sep 2022 00:07:18 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v28so4450932wrd.3
        for <chrome-platform@lists.linux.dev>; Thu, 29 Sep 2022 17:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=OOD5GnY+yF8XWuvuXRG/SQcRpqNEynD57yvkex+WpCc=;
        b=JBzYiWFqqHK9Kdwhzv0C4cHQa5kbDyO+UJ72ST/JX37WcxS7/X6uWsu0JDXmz5P43a
         57cDakWWJrSrPy106baUcgWHrNpdMMMjuK3N2WWgYYsQRtEMKTqV/KLMnNwv3c7wcfB5
         04R1oY1G8eXSP+rYISlEdZLed9SY/CaYSMt2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=OOD5GnY+yF8XWuvuXRG/SQcRpqNEynD57yvkex+WpCc=;
        b=XK1JmA9uYIjG9FLAyvTPOUsL995wquARfUNwB9EZ/EKu8ZAcY2o1o6lAA7KfIhTFgK
         7o5VvX5MEbMcFm6bWLsH9QkpADWVIhuABcUUvm4f5qkYNSZ6QlOGpiR2OSTWKr1cUAlP
         oJ/92+YX/ns4wJDil0B5Mp5cUSeTKaInCwWsFCZdqcmsV9Ycq5vPn6EHjdY/RQ8S+Drl
         2VBllwE9BiFcnzZ/876FnT4V4sQ7d/f14rwdO1LVD/HkgyDMvAz9MZhBI/64Fj/wYBiF
         iniV1IBR7xJLM9HxVOLYtaEryBp0aIjcFCkfAMd8+2XEdROlTLqeZJrOaOVT1StFUHnx
         RrVQ==
X-Gm-Message-State: ACrzQf1X1BZ9NBmXnC+eSsIX7BFYV8nuxcjP3dmMrIQAawDYWva151ga
	CESMCAdNlzq1o16r+urx8Re92aRJKzS8yXWxsRuonw==
X-Google-Smtp-Source: AMsMyM6uXH088zkRixid53ROdQNJyn49XoY8VID40LvNkzwVUz+44PxtT0o0C3mveJ+VL4Y8laPfX3GdGYngxzjsYyU=
X-Received: by 2002:adf:e187:0:b0:22c:981d:5528 with SMTP id
 az7-20020adfe187000000b0022c981d5528mr4016430wrb.407.1664496436338; Thu, 29
 Sep 2022 17:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220927205551.2017473-1-jrosenth@chromium.org>
 <YzPmKF6LRwXVua3X@kroah.com> <YzYwz8puWz+zcaF/@chromium.org>
In-Reply-To: <YzYwz8puWz+zcaF/@chromium.org>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 29 Sep 2022 17:07:04 -0700
Message-ID: <CAODwPW-mLtEjpY1c2rYCOncyBN0=Vk4iqKUqZTQt=is-hxSsMw@mail.gmail.com>
Subject: Re: [RESEND PATCH v10] firmware: google: Implement cbmem in sysfs driver
To: Jack Rosenthal <jrosenth@chromium.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Stephen Boyd <swboyd@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

> > Will this work for all coreboot implementations?
>
> Yes, CBMEM has existed in coreboot since 2009, so it'll work with any
> non-antique version.

FWIW the lb_cbmem_entry tags that this implementation relies on are a
bit newer (2015), but the basic sentiment remains. This is just meant
to add support for the coreboot versions that expose this data, it's
not going to hurt earlier ones that don't (it's just going to create
an empty sysfs directory for those).
