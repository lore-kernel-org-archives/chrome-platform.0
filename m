Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3328017C6
	for <chrome-platform@lists.linux.dev>; Tue, 14 Mar 2023 03:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC57EC433D2;
	Tue, 14 Mar 2023 03:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678763378;
	bh=+mjV2OLtiQflh50OglR/OCV1amu2izlnmSQPmYir1EE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibJaZ2+z95wkkq9+fvaMclmyl8N2GkgTpVDLuHZmp5uWcHafUW1lMlEAoJBRU8iCM
	 eKe6urhGx6m29YnOQuy3b4LHMxNUBXrkHfpkDKdpIA98Uv7P1IpG3pMpuhtvpolSt/
	 SgX2toXbX92m4ERzUjEWSgGsES506JSM0qDugQ707W7m3Ar8gCBDa9CXmOEHrxLysK
	 /bUErfUgi56XKL/WQTrSzs5vgARCwAMCRYckpd1Gje4GApgHBio5cKIcg7mXMCtAuA
	 btRY+9uYDbjMI+TuyRjYI8kbKtRLVW6a6Tkq3nIdgCMuVkLFojChWlQWy4SIB/IZYW
	 g8Jbu3BWmW0Ew==
Date: Tue, 14 Mar 2023 11:09:35 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, guillaume.tucker@collabora.com,
	denys.f@collabora.com
Subject: Re: [PATCH 00/14] cros-ec-tests: fix some exceptions and clean-ups
Message-ID: <ZA/lb8vd2EHHmaIm@google.com>
References: <20230313094431.507952-1-tzungbi@kernel.org>
 <2915ca22-5942-f5bf-d328-41fe6708622f@collabora.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2915ca22-5942-f5bf-d328-41fe6708622f@collabora.com>

Hi Ricardo,

On Mon, Mar 13, 2023 at 12:53:01PM +0100, Ricardo Cañuelo wrote:
> On 13/3/23 10:44, Tzung-Bi Shih wrote:> The series changes cros-ec-tests[1].
> > 
> > It applys some clean-ups and fixes obvious errors.
> > 
> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/cros-ec-tests.git/
> 
> FWIW, there's also this fork [1], that's a bit ahead of [2] and
> it's the one we're currently using for KernelCI [3], since Enric
> is not maintaining the old one anymore.

My original plan was refactoring and cleaning [2] first.  And then porting [4]
to the latest code base.

[4]: https://github.com/kernelci/cros-ec-tests/commit/f6c0dbf63842d5751000c5527808aca38354db55

> Benson, is the cros-ec repo at kernel.org still alive and
> maintained? If so we'll sync it to [1] after this patch lands and
> point KernelCI to it.

I have no strong preference for where to host the repo.  It would be fine if
we abandoned the cros-ec-tests repo at kernel.org.

I guess it would be easier to start from [1] as [3] already pointed to it.  If
it makes sense, I would rebase the series and send to [1].

> [1]: https://github.com/kernelci/cros-ec-tests
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/cros-ec-tests.git/
> [3]: https://github.com/kernelci/kernelci-core/pull/1722
