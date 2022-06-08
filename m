Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262737C
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 02:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166ADC3411F;
	Wed,  8 Jun 2022 02:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654654647;
	bh=AzhrCIWg84o+mxvFW4ZCcksLht8pFT6BvEbsGS24Tr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcJwW+H3Xpd31ezTP4c5X+za/nMkEeTyF6fZNBlFXbsjsiDHFcwazSab6Hu9sWP4j
	 c20Z3TzwEMy5NxZUUHYMQPZ7qjgVOU0Drsj63zZyNOR6eHQgbgwwB8OIZkOxE5/UV6
	 +hpjBvzilOoBsDtUWhwsp3qCnEzVDodlw8I7rTm0TqpHpQj+yJEmnkDJNI2vfoG3CN
	 /u7dqLDNs7ZWAkZfdRszxsVWfvIToq8hHFSx2nJzCXVDNK5v06NHnv3G9YW9vdnesG
	 FoC4VvjRTJ0/qJakOhMOm9y0s+G18C/uiGH1G/0ijmNasqT5BiqTeNyj3IG+EY/JWb
	 KKD73eHWchMgA==
Date: Wed, 8 Jun 2022 02:17:23 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <groeck@google.com>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/15] platform/chrome: cros_ec_proto: return 0 on
 getting version mask success
Message-ID: <YqAGsx6TTHTFeTNs@google.com>
References: <20220607145639.2362750-1-tzungbi@kernel.org>
 <20220607145639.2362750-15-tzungbi@kernel.org>
 <CABXOdTcBauEYxOokg3PHGwYfgjAHNPGzf9mHnNFTyhcucv+rzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXOdTcBauEYxOokg3PHGwYfgjAHNPGzf9mHnNFTyhcucv+rzg@mail.gmail.com>

On Tue, Jun 07, 2022 at 12:11:23PM -0700, Guenter Roeck wrote:
> On Tue, Jun 7, 2022 at 7:57 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > cros_ec_get_host_command_version_mask() used to return value from
> > send_command() which is number of bytes for input payload on success
> > (i.e. sizeof(struct ec_response_get_cmd_versions)).
> >
> > However, the callers don't need to know how many bytes are available.
> >
> > - Fix cros_ec_get_host_command_version_mask() to return 0 on success;
> >   negative integers on error.
> >
> > - Remove the unneeded `ver_mask` initialization as the callers should
> >   take it only if cros_ec_get_host_command_version_mask() returns 0.
> >
> > - Add a Kunit test: `ver_mask` has some garbage bytes from previous
> >   EC_CMD_GET_NEXT_EVENT but there is no host sleep to make sure the
> >   caller checks the return values correctly.
> >
> This should be separate patches.

Ack.  Will fix in next version.
