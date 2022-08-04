Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5897F
	for <chrome-platform@lists.linux.dev>; Thu,  4 Aug 2022 09:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C9AC433D7;
	Thu,  4 Aug 2022 09:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659603647;
	bh=eXMvzUZu95Ah5TbkmgO+GruIO4JfBPp3ZniH6uNDpd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D5wKjSH12jEj/mlQt3SnP7nUTkjzqys+walMZ821HX8I8zR9zvAeCVJ8RS9N26Dqx
	 Dqxa0D2ECes/088nEbAJUCz0w3fD2Kq/Mo5YyYTfB9lRrTKWo31clb/9Viz5dP8/sg
	 N73sEzyBJMfDD/rd5N0NRXWXVhhcLP1fJQLoPPA3W/QGsh3O6HByna1ERwOe7Gi7Gx
	 X0aB9ShcDATEmFzZFocTGMNUbtYdWvt8n0GfVvmtcHXBlLpCtJGHekhcpZZHa9jzTE
	 sj/PzOmXoCwvtq5rji40M8n2hpRh9E5o/iqdTMuxVFs99QY3Ln83JaSItjYLorjPCR
	 a8Nm5WbNMmQtA==
Date: Thu, 4 Aug 2022 09:00:43 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Patryk Duda <pdk@semihalf.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@google.com>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	upstream@semihalf.com
Subject: Re: [PATCH v1] platform/chrome: cros_ec_proto: Update version on
 GET_NEXT_EVENT failure
Message-ID: <YuuKu4b02siXj/TS@google.com>
References: <20220714160951.9364-1-pdk@semihalf.com>
 <20220802154128.21175-1-pdk@semihalf.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802154128.21175-1-pdk@semihalf.com>

On Tue, Aug 02, 2022 at 05:41:28PM +0200, Patryk Duda wrote:
> Fixes: 3300fdd630d4 ("platform/chrome: cros_ec: handle MKBP more events flag")
> Cc: <stable@vger.kernel.org> # 5.10+

Any concerns if removing the Cc tag?  As I think a Fixes tag should be
sufficient.  On a related note, why did you specify for only 5.10+?

> Signed-off-by: Patryk Duda <pdk@semihalf.com>

You should collect the Reviewed-by tags the patch already got as dropping
`ver_mask` initialization isn't a big change.  I could do that for the patch
this time.

[...]
> v0 -> v1
> - Dropped `ver_mask` initialization.

Please start versioning from v1 next time.
