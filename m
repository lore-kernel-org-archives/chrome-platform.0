Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0837C6135
	for <chrome-platform@lists.linux.dev>; Tue, 30 Aug 2022 23:05:37 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id f4so9633407qkl.7
        for <chrome-platform@lists.linux.dev>; Tue, 30 Aug 2022 16:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3q+RTaRoDJ/mS6E2OdJGUZUv/ANh5AS0o0Ziht8MEyk=;
        b=PgxTnvTE29KCKVSMRimB72WadJkatYaN9T3nsES8Z9oojD1WTJQEamPUKdaq1Ym4ZD
         NyUTCKpvvAcet2PSsMpf3O1BtqIkpFuG7nrMyIFlreo8CgAOl2oCb6Y9I2vjdcdMk/JR
         662tf3ZT0yOm21sB0rvyCZCLS1g/C93AZJlkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3q+RTaRoDJ/mS6E2OdJGUZUv/ANh5AS0o0Ziht8MEyk=;
        b=fdGUiIJOeO0O4T9fztOGtOltc9z0RVkxJOU56OYhtw2g2TNBFqc3FVenvVFtTrWvER
         50UkAHn4vnlzNSgrj7+TQUrwnawy6mt/Qg7ahQjIpqFfL6l6PEdhW4AFtrzkrEOfSxEl
         LdKu1/9XnzXlBwnCN5bcCtZjs4wypsbudIjv74js2E7jAQ3C1Pm2PWhCyR4phMgPFOdj
         BJk70vOkVTazrYAhM/VtwlDRJn5VfotKIIDb+MUl7GfWRJjFKMbeZwItfeUVvrSTaCJX
         2RCyuJ1H5ZcklOAPOgdjsdNSs5kUjXR4JEdW99t3bna0UtZUKBvKt8cAOD4rB8Grpsm2
         3e3w==
X-Gm-Message-State: ACgBeo1xmqtTb3nERhjD5EQ4r1fDL9UrmLOeOrB72m+fVJjPe6ZqI2eD
	w3ScCGVDuHZ89I4lAknd3UqiXMBml5TbJyYuyBja5Q==
X-Google-Smtp-Source: AA6agR5Cdy05jCjyZers7UuBLDnUBYOzZ0flmb/NVCrmjXIpevYhyeQiLMi8DfapiijfzKnTxqRo7TCVyUg03BwkPsA=
X-Received: by 2002:a37:bd6:0:b0:6ba:f6d1:9619 with SMTP id
 205-20020a370bd6000000b006baf6d19619mr13070687qkl.366.1661900736963; Tue, 30
 Aug 2022 16:05:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220830225831.2362403-1-swboyd@chromium.org> <20220830225831.2362403-4-swboyd@chromium.org>
In-Reply-To: <20220830225831.2362403-4-swboyd@chromium.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 30 Aug 2022 16:05:25 -0700
Message-ID: <CACeCKad+aXZbSmkd6puSrw7XVUvy1pnta4-2-4dhoJo44dzSYQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] platform/chrome: cros_typec_switch: Use
 PTR_ERR_OR_ZERO() to simplify
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, chrome-platform@lists.linux.dev, 
	Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 30, 2022 at 3:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Use the standard error pointer macro to shorten the code and simplify.
>
> Cc: Prashant Malani <pmalani@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Prashant Malani <pmalani@chromium.org>
