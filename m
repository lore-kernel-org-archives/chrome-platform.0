Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0026362
	for <chrome-platform@lists.linux.dev>; Wed, 12 Apr 2023 02:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DD1C433D2;
	Wed, 12 Apr 2023 02:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681267731;
	bh=TTGejWxQMiVHa9JpuFTdRCnqjvZge9A2bDyPgijyz3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hfy6nSBnbswNU9KJ4+4kop/tO+s/ZSws95dcD+KW2hkqT0QrbEZ4JTKUin3OXRMDU
	 SZJWqkXF4GgvxjPDcZZIhgOv2qwdaJKlzWLPJlzVRPbuKi63Gru4zLlQLqNYJfgbZ8
	 vmh7HtPuRXb0BP/SlbCWrLG4AKmFD58trH3i3h5ogWCEt/Oe5qee34I9etjM8Ec3tV
	 GWC0bKvjfz0THbYPCmoF6kKT+OsrvI/F7ml4y1UWQSu6EADiJtOsbfmwpXQ+ijiml3
	 F4Q/2De8WudsvZYmFziMMuOo+FHkM3kgQjpvYdYSCI60E3cBTuOjH7iKTw7Ge1kc73
	 oQDxlLMHUazNw==
Date: Wed, 12 Apr 2023 10:48:48 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, robbarnes@google.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_debugfs: fix kernel-doc warning
Message-ID: <ZDYcENIWeBgnQQ29@google.com>
References: <20230411053308.1572493-1-tzungbi@kernel.org>
 <CACeCKaduOqLwGsGLEVzdG2hDNq8=07a_V-uGLZWT0f3+Wb603Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACeCKaduOqLwGsGLEVzdG2hDNq8=07a_V-uGLZWT0f3+Wb603Q@mail.gmail.com>

On Tue, Apr 11, 2023 at 10:38:15AM -0700, Prashant Malani wrote:
> On Mon, Apr 10, 2023 at 10:33 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > Fix the following kernel-doc warning:
> >
> > $ ./scripts/kernel-doc -none drivers/platform/chrome/*
> > [...]
> > warning: This comment starts with '/**', but isn't a kernel-doc comment.
> >
> > Fixes: 14bb09b32f43 ("platform/chrome: cros_ec: Separate logic for getting panic info")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > ---
> > I should put it in my checklist in the future before pushing patches to
> > for-next.
> 
> Can this be added to kernelci?

I'm afraid not; build tests performed by KernelCI only for its tests.  0-day
performs better on such kind of static checks.
